import java.io.FileReader;
import java.io.IOException;
import java.io.BufferedReader;
import java.util.ArrayList;
import java.util.List;

public class December1_1 {

    public List<String> readLines(String filePath) {
        List<String> lines = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                lines.add(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return lines;
    }

    public static void main(String[] args) {
        int dialPoint = 50;
        int amountOfZeros = 0;
        December1_1 december1_1 = new December1_1();
        List<String> lines = december1_1.readLines(args[0]);
        for (String line : lines) {
            String rotation = line.substring(0, 1);
            int clicks = Integer.parseInt(line.substring(1));
            switch (rotation) {
                case "L":
                    dialPoint = dialPoint - clicks;
                    while (dialPoint < 0) {
                        dialPoint += 100;
                    }

                    if (dialPoint == 0) {
                        amountOfZeros++;
                    }
                    break;
                case "R":
                    dialPoint = dialPoint + clicks;
                    while (dialPoint > 99) {
                        dialPoint -= 100;
                    }

                    if (dialPoint == 0) {
                        amountOfZeros++;
                    }
            }
        }

        System.out.println(amountOfZeros);
    }

}
