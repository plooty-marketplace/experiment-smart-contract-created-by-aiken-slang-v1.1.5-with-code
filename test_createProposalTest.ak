test createProposalTest() {
    let description = "Proposal 1: Increase budget for community projects.";
    createProposal(description);
    let proposal = getProposal(0);
    assert(proposal.description == description);
    assert(proposal.votes == 0);
}

test voteTest() {
    let description = "Proposal 2: Fund new park.";
    createProposal(description);
    vote(1);
    let proposal = getProposal(1);
    assert(proposal.votes == 1);
}

test getProposalTest() {
    let description = "Proposal 3: Host a community event.";
    createProposal(description);
    let proposal = getProposal(2);
    assert(proposal.description == description);
}