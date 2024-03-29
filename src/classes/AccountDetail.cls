public class AccountDetail {
    
    public List<User> UserTemp = new List<User>();
    public AccountDetail()
    {
    
    }
    
    public List<SelectOption> UserList
    {
        get
        {
            UserTemp = [Select u.LastName, u.Id, u.FirstName, u.Email From User u];
            
            UserList = new List<SelectOption>();
            
            for(User temp : UserTemp)
            {
                UserList.add(new SelectOption(temp.Id, temp.LastName));
            }
            return UserList;
        }
        set;
    }
    
}