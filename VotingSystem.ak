use aiken/collection/list
use aiken/fuzz
use cardano/assets
use cardano/transaction.{Transaction}

contract VotingSystem {
    record Proposal {
        string description;
        int votes;
        address creator;
    }

    map(int, Proposal) public proposals;
    int public proposalCount;

    event ProposalCreated(int proposalId, string description, address creator);
    event Voted(int proposalId, address voter);

    // Create a new proposal
    public function createProposal(description: string) {
        let proposalId = proposalCount;
        proposals[proposalId] = Proposal { description, votes: 0, creator: msg.sender };
        proposalCount += 1;

        emit ProposalCreated(proposalId, description, msg.sender);
    }

    // Vote for a proposal
    public function vote(proposalId: int) {
        require(proposals.contains(proposalId), "Proposal does not exist.");
        
        let proposal = proposals[proposalId];
        proposal.votes += 1;
        proposals[proposalId] = proposal; // Update the proposal record

        emit Voted(proposalId, msg.sender);
    }

    // Get the results of a proposal
    public function getProposal(proposalId: int) public view returns (Proposal) {
        require(proposals.contains(proposalId), "Proposal does not exist.");
        return proposals[proposalId];
    }
}