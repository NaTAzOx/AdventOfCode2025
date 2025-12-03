fn read_file(file_path: &str) -> std::io::Result<String> {
    use std::fs::File;
    use std::io::Read;

    let mut file = File::open(file_path)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

fn main() {
    let file_path = "input.txt";
    let mut result : i32 = 0;
    match read_file(file_path) {
        Ok(contents) => for line in contents.lines() {
            let mut greatest : i32 = 0;
            let mut second_greatest : i32 = 0;
            let split_line: Vec<char> = line.chars().collect();
            for (index, char) in split_line.iter().enumerate() {
                let char_to_int : i32 = char.to_digit(10).unwrap() as i32;
                if char_to_int > greatest && index != split_line.len() - 1 {
                    second_greatest = 0;
                    greatest = char_to_int;
                } else if char_to_int > second_greatest {
                    second_greatest = char_to_int;
                }
            }
            let mut greatest_to_char = char::from_digit(greatest as u32, 10).unwrap();
            let mut second_greatest_to_char = char::from_digit(second_greatest as u32, 10).unwrap();
            let mut assembly = greatest_to_char.to_string() + &second_greatest_to_char.to_string();
            result = result + assembly.parse::<i32>().unwrap();
        },
        Err(e) => eprintln!("Error reading file: {}", e),
    }

    println!("{}", result);
}