pragma solidity ^0.8.0;

    // 1) The owner can start the bank with initial deposit/capital in ether (min 50 eths)
    // 2) Only the owner can close the bank. Upon closing the balance should return to the Owner
    // 3) Anyone can open an account in the bank for Account opening they need to deposit ether with address
    // 4) Bank will maintain balances of accounts
    // 5) Anyone can deposit in the bank
    // 6) Only valid account holders can withdraw
    // 7) First 5 accounts will get a bonus of 1 ether in bonus
    // 8) Account holder can inquiry balance

    contract MyBank{

    event Log(string);
    uint counter;
    address owner;
    uint  balance;
    mapping(address=>uint) public account;
   
   
    constructor() payable{
        require(msg.value >= 50 ether, "50 Ether is required to start bank");
        owner = msg.sender;
        balance = msg.value;
    }


    modifier chkOwner(){
        require( owner == msg.sender , "Your not the owner this Bank.");
        _;
    }


    modifier NotOwner{
        require( owner != msg.sender , "Your the owner of this Bank.");
        _;
    }


    function chkBankOwner()  public view chkOwner() returns(string memory){
        return "your owner";
        }
     

     function destroyContract() public  chkOwner()  returns(string memory result) {
         payable((msg.sender)).transfer(address(this).balance);
         return "Account deleted!";
     }



    function createAccount() public NotOwner payable{
        require(msg.value >= 1 ether, "Please enter some amount");

            if(counter <= 0)
            {
                counter++;
            }
        account[msg.sender] = msg.value;
        emit Log("Account created!.");
        }


    function currentBalance() public view returns (uint) {
        return account[msg.sender];
    }


    function withdrawAmount(uint amount) public NotOwner payable{
        require(account[msg.sender] >= amount, "You have no amount!");
     
        payable(msg.sender).transfer(amount);
        account[msg.sender] = account[msg.sender] - amount ;
        emit Log("amount Withdrawn from your account!");
    }


    function depositAmount(uint amount) public NotOwner{
        require(account[msg.sender] >= 0 ether, "You have no amount!");

      account[msg.sender] += amount ;
        emit Log("amount deposited to your account!");
    }



    }
