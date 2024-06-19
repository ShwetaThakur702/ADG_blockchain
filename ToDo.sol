//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.9;
contract ToDolist{
	uint256 public_idUser;
	address[] public creators;
	string[] public message;
	uint256[] public messageId;
	struct ToDoListApp{
		address account;
		uint256 userId;
		string message;
		bool completed;
	}
	event ToDoevent(
		address indexed account,
		uint256 indexed userId,
		string message,
		bool completed
	);
	mapping(address => ToDoListApp) public toDoListApps;

	constructor() {
		ownerOfContract = msg.sender;

	}

	function inc() internal {
		idUser++;

	}

	function createList(string calldata _message) external{
		inc();

		uint256 idNumber = _idUser;
		ToDoListApp storage toDo = toDoListApps[msg.sender];
		toDo.account=msg.sender;
		toDo.message= _message;
		toDo.completed=false;
		toDo.userId=idNumber;
		creators.push(msg.sender);
		message.push(_message);
		messageId.push(idNumber);

		emit ToDoEvent(msg.sender, toDo.userId, _message, toDocompleted);
	}
}
