// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

            // -------------------------------------------------- \\
            // ----- EIP-20: ERC-20 Token Standard          ----- \\
            // ----- https://eips.ethereum.org/EIPS/eip-20  ----- \\
            // -------------------------------------------------- \\

interface ERC20Interface
{
    function totalSupply() external view returns(uint);
    function balanceOf(address tokenOwner) external view returns(uint balance);
    function transfer(address to, uint tokens) external returns(bool success);

    function allowance(address tokenOwner, address spender) external view returns(uint remaining);
    function approve(address spender, uint tokens) external returns(bool success);
    function transferForm(address from, address to, uint tokens) external returns(bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract Block is ERC20Interface
{
    // name of the token
    string public Name = "Block";
    string public Symbol = "BLK";

    string public Decimal = '0';
    uint public override totalSupply;
    address public Founder;

    // create the mapping of address and int
    mapping(address=>uint) public balances;

    // nested mapping 
    mapping(address => mapping(address => uint)) public Allowed;

    constructor()
    {
        totalSupply = 100000;
        Founder = msg.sender;
        balances[Founder] = totalSupply;
    }

    function balanceOf(address tokenOwner) external view override returns(uint balance)
    {
        return balances[tokenOwner];
    }

    function transfer(address to, uint tokens) public override virtual returns(bool success)
    {
        require(balances[msg.sender] >= tokens);
        // add into the receivers account
        balances[to] = balances[to] + tokens;
        // subtract from the sender acc
        balances[msg.sender] = balances[msg.sender] - tokens;

        emit Transfer(msg.sender, to, tokens);
        return true;
    }

    function approve(address spender, uint tokens) external override returns(bool success)
    {
        require(balances[msg.sender] >= tokens);
        require(tokens > 0);

        Allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }

    function allowance(address tokenOwner, address spender) external view override returns(uint NoOfTokens)
    {
        return Allowed[tokenOwner][spender];
    }

    function transferForm(address From, address To, uint tokens) public override virtual returns(bool success)
    {
        require(Allowed[From][To] >= tokens);
        require(balances[From] >= tokens);

        balances[From] -= tokens;
        balances[To] += tokens;

        return true;
    }
}

contract ICO is Block
{
    address public Manager;
    address payable public Deposit;

    uint tokenPrice = 0.1 ether;

    uint public Cap = 300 ether;
    uint public raisedAmount;

    uint public ICOstart = block.timestamp;
    uint public ICOend = block.timestamp + 3600;

    uint public tokenTradeTime = ICOend + 3600;

    uint public MaxInvest = 10 ether;
    uint public MinInvest = 0.1 ether;

    enum State
    {
        beforeStart,
        afterEnd,
        running,
        halted
    }

    State public icoState;

    event Invest(address investor, uint value, uint tokens);

    // to initialize the Manager and state
    constructor(address payable _deposit)
    {
        Deposit = _deposit;
        Manager = msg.sender;
        icoState = State.beforeStart;
    }

    // create the modifier for checking the onwer hai ya nahi
    modifier CheckOnlyOwner()
    {
        require(msg.sender == Manager);
        _;
    }

    // check the state of the ICO
    function Halt() public CheckOnlyOwner
    {
        icoState = State.halted;
    }

    function Resume() public CheckOnlyOwner
    {
        icoState = State.running;
    }

    function ChangeDepositAddress(address payable NewDeposit) public CheckOnlyOwner
    {
        Deposit = NewDeposit;
    }

    function GetState() public view returns(State)
    {
        if(icoState == State.halted)
        {
            return State.halted;
        }
        else if(block.timestamp < ICOstart)
        {
            return State.beforeStart;
        }
        else if(block.timestamp >= ICOstart && block.timestamp <= ICOend)
        {
            return State.running;
        }
        else
        {
            return State.afterEnd;
        }
    }

    function INVEST() payable public returns(bool)
    {
        icoState = GetState();
        require(icoState == State.running);
        require(msg.value >= MinInvest && msg.value <= MaxInvest);

        raisedAmount = msg.value;

        require(raisedAmount <= Cap);

        uint tokens = msg.value/tokenPrice;
        balances[msg.sender] += tokens;
        balances[Founder] -= tokens;

        Deposit.transfer(msg.value);

        emit Invest(msg.sender, msg.value, tokens);
        return true;
    }

    // the burn function will maintain the demand and supply in market
    function BURN() public returns(bool)
    {
        icoState = GetState();
        require(icoState == State.afterEnd);

        balances[Founder] = 0;
        return true;
    }

    function transfer(address To, uint tokens) public override returns(bool success)
    {
        require(block.timestamp > tokenTradeTime);
        super.transfer(To, tokens);

        return true;
    }

    function transferForm(address From, address To, uint tokens) public override returns(bool success)
    {
        require(block.timestamp > tokenTradeTime);
        super.transferForm(From, To, tokens);

        return true;
    }

    receive() external payable
    {
        INVEST();
    }
    
}
