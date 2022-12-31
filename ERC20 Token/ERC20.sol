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

    function transfer(address to, uint tokens) external override returns(bool success)
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

    function transferForm(address From, address To, uint tokens) external override returns(bool success)
    {
        require(Allowed[From][To] >= tokens);
        require(balances[From] >= tokens);

        balances[From] -= tokens;
        balances[To] += tokens;

        return true;
    }
}