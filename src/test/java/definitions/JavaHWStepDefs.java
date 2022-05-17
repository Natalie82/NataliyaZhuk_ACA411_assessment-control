package definitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;

public class JavaHWStepDefs {
    @Given("I write my text")
    public void iWriteMyText() {
        System.out.println("Today is a great Wednesday");
    }

    @Given("I convert {int} foot to centimeters")
    public void iConvertFootToCentimeters(int iFeet) {
        double iCen = 30.48 * iFeet;
        System.out.println("Expected result: " + iFeet + " foot equals " + iCen + " centimeters");
    }

    @And("I convert {int} US gallon to liters")
    public void iConvertUSGallonToLiters(int iGallon) {
        double iLiter = 4.54 * iGallon;
        System.out.println("Expected result: " + iGallon + " gallon equals " + iLiter + " litters");
    }

    @And("I convert {int} celsius to fahrenheit")
    public void iConvertCelsiusToFahrenheit(int iCel) {
        int iFahren = (iCel * 9 / 5) + 32;
        System.out.println("Expected result: " + iCel + " celsius equals " + iFahren + " fahrenheit");

    }

    @Given("I check if number {int} is odd or even")
    public void iCheckIfNumberIsOddOrEven(int iNum) {
        if (iNum % 2 == 0) {
            System.out.println("Number " + iNum + " is even");
        } else {
            System.out.println("Number " + iNum + " is odd");
        }
    }

    @Given("I got {int} percent on my test")
    public void iGotPercentOnMyTest(int arg0) {
        int iGrade = 89;
        if (iGrade >= 90 && iGrade <= 100) {
            System.out.println("You passed with A");
        } else if (iGrade >= 80 && iGrade <= 89) {
            System.out.println("You passed with B");
        } else if (iGrade >= 70 && iGrade <= 79) {
            System.out.println("You passed with C");
        } else if (iGrade >= 60 && iGrade <= 69) {
            System.out.println("You passed with D");
        } else {
            System.out.println("You failed");
        }
    }

    @Given("I find the cost of {int} pounds of {string}")
    public void iFindTheCostOfPoundsOf(int iPound, String sFruit) {
        double price[] = {1.10, 1.20, 1.30, 1.50, 1.40};
        for (int i = 0; i < price.length; i++) ;
        switch (sFruit) {
            case "apples":
                double applesCost = iPound * price[0];
                System.out.println("Cost of apples = $" + applesCost);break;
            case "cherries":
                double cherriesCost = iPound * price[1];
                System.out.println("Cost of cherries = $" + cherriesCost);break;
            case "plums":
                double plumsCost = iPound * price[2];
                System.out.println("Cost of plums = $" + plumsCost);break;
            case "grapefruit":
                double grapefruitCost = iPound * price[3];
                System.out.println("Cost of grapefruit = $" + grapefruitCost);break;
            case "oranges":
                double orangesCost = iPound * price[4];
                System.out.println("Cost of oranges = $" + orangesCost);break;
            default: System.out.println("This product is unavailable");
        }
    }
    @Given("I print all elements in the array")
    public void iPrintAllElementsInTheArray() {
        String[] weekDays={"Monday","Tuesday","Wednesday","Thursday","Friday","Saturday", "Sunday"};
        //for loop to print elements of array
        for (int i=0; i< weekDays.length; i++){
            System.out.println(weekDays[i]);
        }
    }
}
