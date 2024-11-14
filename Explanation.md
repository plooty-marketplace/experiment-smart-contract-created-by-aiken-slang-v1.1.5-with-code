### Explanation of the Contract

1. Records:

   -Proposal: A record that holds the description of the proposal, the number of votes it has received, and the address of the creator.
2. Mappings:

    -proposals: A map that associates proposal IDs (integers) with their corresponding Proposal records.
    -proposalCount: 
An integer that keeps track of the total number of proposals created.

4. Events:

   -ProposalCreated: Emitted when a new proposal is created, logging the proposal ID, description, and creator's address.
   -Voted: Emitted when a vote is cast for a proposal, logging the proposal ID and the voter's address.
4. Functions:

   -createProposal: Allows users to create a new proposal by providing a description. It assigns a unique ID to the proposal and emits the ProposalCreated event.
   -vote: Allows users to vote for a specific proposal by its ID. It checks if the proposal exists, increments the vote count, and emits the Voted event.
   -getProposal: Allows users to retrieve the details of a specific proposal by its ID. It checks if the proposal exists and returns the corresponding Proposal record.