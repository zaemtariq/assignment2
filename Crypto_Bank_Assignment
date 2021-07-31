
pragma solidity ^0.8.0;

//Create Crypto Bank Contract

//  1) The owner can start the bank with initial deposit/capital in ether (min 50 eths)
//  2) Only the owner can close the bank. Upon closing the balance should return to the Owner
//  3) Anyone can open an account in the bank for Account opening they need to deposit ether with address
//  4) Bank will maintain balances of accounts
//  5) Anyone can deposit in the bank
//  6) Only valid account holders can withdraw
//  7) First 5 accounts will get a bonus of 1 ether in bonus
//  8) Account holder can inquiry balance
//  The depositor can request for closing an account


//Name: Zaeem Tariq   Roll.No: PIAIC79218


contract CryptoBank {
    
    uint private _accounts;
    address public owner;
    mapping (address => uint) private balance;
    

event logStr(string);
 
    constructor() public payable {
        require(msg.value == 50 ether, "Please provide 50 ether to start your contract");
        owner = msg.sender; 
       _accounts = 0;
    }
    
     modifier isOwner (address payable _owner)
    {
        if(_owner == owner){
            _;
                }    


        }

 
    function newAccount() public returns (uint) {
        if (_accounts < 5) 
        {
            _accounts++;
            balance[msg.sender] = 1 ether;
        }
        
        return balance[msg.sender];
    }

    function depositBalance() public payable returns (uint) {
        balance[msg.sender] += msg.value;
    
        return balance[msg.sender];
    }

    
    function withdrawAmounts(uint  withdrawAmount) public payable returns (uint remainBalance) {
        
        if (withdrawAmount <= balance[msg.sender]) {
            balance[msg.sender] -= withdrawAmount;
            payable(owner).transfer(withdrawAmount);
        }
        return balance[msg.sender];
    }

   
    function currentBalance() public view returns (uint) {
        return balance[msg.sender];
    }




    function depositsBalance() public view returns (uint) {
        return address(this).balance;
    }
    
    function bankClose()  public  isOwner(payable( msg.sender)){
        selfdestruct(payable(owner));
        
    }
}
