// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Event_Oranization
{
    // Basic Structure of Event Will be stored in the struct 
    struct Event
    {
        address Organiser;
        string Name;
        uint Date;
        uint Price;
        uint TicketCount;
        uint TicketRemain;
    }

    // to map the Number of Events
    mapping(uint => Event) public events;
    uint public nextID;

    mapping(address => mapping(uint => uint)) public Tickets;

    // Create the Event
    function addEvent(string memory Name, uint Date, uint Price, uint TicketCount) public
    {
        require(Date > block.timestamp, "You Can Create the Future Events !!");
        require(TicketCount > 0, "You Can Organize the Event Only if You can Create more than 0 tickets !!");

        // add into the Mapping
        events[nextID] = Event(msg.sender, Name, Date, Price, TicketCount, TicketCount);
    
        nextID++;
    }

    function BuyTicket(uint ID, uint Quantity) external payable
    {
        require(events[ID].Date != 0, "This Event Does Not Exist !!");
        require(events[ID].Date > block.timestamp, "Event Does Not Occur !!");

        // store it in the Event
        Event storage _event = events[ID];

        // check the atendee paying the correct amt of ether
        require(msg.value == (_event.Price*Quantity), "Insufficient Amount of Ether !!");
    
        // check the ticket are available or not
        require(_event.TicketRemain >= Quantity, "Less Tickets are Available !!");
        _event.TicketRemain -= Quantity;

        Tickets[msg.sender][ID] += Quantity;
    }

    function TransferTicket(uint eventID, uint Quantity, address To) external
    {
        require(events[eventID].Date != 0, "This Event Does Not Exist !!");
        require(events[eventID].Date > block.timestamp, "Event Does Not Occur !!");
    
        // we have to check the 
        require(Tickets[msg.sender][eventID] >= Quantity, "Insufficient Amount of Tickets !!");

        // subtract tickets from senders address
        Tickets[msg.sender][eventID] -= Quantity;

        // Add into the Receivers address
        Tickets[To][eventID] += Quantity;
    }
}