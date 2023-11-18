contract OwnerManagedContract {
    address public owner;
    uint public balance;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function setBalance(uint _balance) public onlyOwner {
        balance = _balance;
    }

    function assertExample() public view {
        assert(balance > 0);
    }

    function revertFunction(uint _value) public pure {
        if (_value == 0) {
            revert("Value must not be zero");
        }
    }
}
