#!/bin/bash

mathematics() {
  local -r filePath="$1"
  if [[ ! -f "$filePath" ]]; then
    echo "Error: File '$filePath' does not exist." >&2
    return 1
  fi

  mapfile -t lines < <(
    sed -E 's/[[:space:]]+/ /g; s/^[[:space:]]+//; s/[[:space:]]+$//' "$filePath" | sed '/^$/d'
  )

  if (( ${#lines[@]} % 5 != 0 )); then
    echo "Error: Expected blocks of 4 lines (4 rows of numbers + 1 row of operators)." >&2
    return 1
  fi

  local -i total=0

  for ((base=0; base<${#lines[@]}; base+=5)); do
    local -a r1 r2 r3 r4 ops
    IFS=' ' read -r -a r1  <<< "${lines[base]}"
    IFS=' ' read -r -a r2  <<< "${lines[base+1]}"
    IFS=' ' read -r -a r3  <<< "${lines[base+2]}"
    IFS=' ' read -r -a r4 <<< "${lines[base+3]}"
    IFS=' ' read -r -a ops <<< "${lines[base+4]}"

    local -i cols="${#ops[@]}"
    if (( cols == 0 )); then
      echo "Error: Missing operators in block starting at line $((base+1))." >&2
      return 1
    fi

    if (( ${#r1[@]} != cols || ${#r2[@]} != cols || ${#r3[@]} != cols || ${#r4[@]} != cols )); then
      echo "Error: Column mismatch in block starting at line $((base+1)) (numbers must match operator count)." >&2
      return 1
    fi

    for ((c=0; c<cols; c++)); do
      local n1="${r1[c]}" n2="${r2[c]}" n3="${r3[c]}" n4="${r4[c]}" op="${ops[c]}"

      if [[ ! "$n1" =~ ^-?[0-9]+$ || ! "$n2" =~ ^-?[0-9]+$ || ! "$n3" =~ ^-?[0-9]+$ || ! "$n4" =~ ^-?[0-9]+$ ]]; then
        echo "Error: Non-integer value in column $((c+1)) of block starting at line $((base+1))." >&2
        return 1
      fi

      local -i colResult
      case "$op" in
        '+') colResult=$(( n1 + n2 + n3 + n4 )) ;;
        '*') colResult=$(( n1 * n2 * n3 * n4 )) ;;
        *)   echo "Error: Invalid operator '$op' in column $((c+1)) (use + or *)." >&2
             return 1 ;;
      esac

      total=$(( total + colResult ))
      echo $total
    done
  done

  printf '%s\n' "$total"
}

mathematics "$1"