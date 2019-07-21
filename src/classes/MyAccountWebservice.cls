global class MyAccountWebservice{

    webservice static Id makeContactInsertorUpdate(String lastName){
    
    Account c = new Account(Name=lastName);
    insert c;
    return c.id;
    }

}