// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "https://github.com/jeffprestes/cursosolidity/blob/master/bradesco_token_aberto.sol";

contract TccTreinamento {

    ExercicioToken private exercicioToken;

    string primeiroNome;
    string sobreNome;
    string agencia;
    string conta;
    address payable endereco;
    //address endereco;
    //        address enderecoCustodia; // armazena um endereco para o cliente. Se quiser mandar ether pra cconta do cliente, colocar aqui

    constructor(
        string memory _primeiroNome,
        string memory _sobreNome,        
        string memory _agencia,
        string memory _conta) payable {

        exercicioToken = ExercicioToken(0x8431717927C4a3343bCf1626e7B5B1D31E240406);
        primeiroNome = _primeiroNome;
        sobreNome = _sobreNome;
        agencia = _agencia;
        conta = _conta;
        //endereco = msg.sender;       
        endereco = payable(msg.sender);

    }

    // function whoami() public view returns (address) {
	// 	address sender = msg.sender;
	// 	return sender;
	// }
    // function whoami2() public view returns (address) {
    //     return address(this);
    // }

    // function meuSaldo(uint256) external view returns (uint256){
    // function meuSaldo() external view returns (uint256){
    //     return exercicioToken.balanceOf(msg.sender);
    // }
    function meuSaldo() external view returns(uint256) {
        return exercicioToken.balanceOf(address(this));
    }

    // function mint(address account, uint256 amount) public returns (bool) {
    // function gerarTokenParaEuCliente(uint256 _amount) public returns (bool){
    //     return exercicioToken.mint(address(this), _amount);
    // }
    function gerarTokenParaEuCliente(uint256 _amount) public returns (bool){
        return exercicioToken.mint(address(this), _amount);
    }

    // function transfer(address to, uint256 amount) 
    // public 
    // override  
    // hasEnoughBalance(msg.sender, amount) 
    // tokenAmountValid(amount) 
    // returns (bool) 
    // {
    //     balances[msg.sender] = balances[msg.sender] - amount;
    //     balances[to] = balances[to] + amount;
    //     emit Transfer(msg.sender, to, amount);
    //     return true;
    // } 
    function transfer(address to, uint256 amount) public returns (bool){
        return exercicioToken.transfer(to, amount);
    }

    // function balanceOf(address tokenOwner) public override view returns(uint256) {
    //     return balances[tokenOwner];
    // }
    function saldoContratoCriptomoedaNativa() public view returns (uint){
        return address(this).balance;
    }

    //ajuda obtida Gabriel
    function transfereMoedaNativa(address payable _to, uint256 _amount) public payable  {
        //require(msg.sender == clientAccount);
        require(msg.sender == endereco);
        _to.transfer(_amount);
    }

        receive() external payable {}


}