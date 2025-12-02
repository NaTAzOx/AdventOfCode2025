<?php

function readAFile($filePath) : bool|string {
    $fileContents = file_get_contents($filePath);
    if ($fileContents === false) {
        throw new Exception("Could not read the file: $filePath");
    }
    return $fileContents;
}

try {
    $allInvalid = 0;
    $data = readAFile('December2\December2-1\input.txt');
    $split = preg_split('/[\s,]+/', $data);
    foreach ($split as $line) {
        $limits = preg_split('/[\s-]+/', $line);
        $low = intval($limits[0]);
        $high = intval($limits[1]);
        for ($low; $low <= $high; $low++) {
            $lowToString = strval($low);
            $firstHalf = substr($lowToString, 0, intdiv(strlen($lowToString), 2));
            $secondHalf = substr($lowToString, intdiv(strlen($lowToString), 2), strlen($lowToString));
            if (strcmp($firstHalf, $secondHalf) === 0) {
                $allInvalid += $low;
            }
        }
    }

    echo $allInvalid;
} catch (Exception $e) {
    echo 'Error: ' . $e->getMessage();
}

?>