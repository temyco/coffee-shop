import {message, danger, warn} from "danger"

// Always ensure we assign someone, so that our Slackbot can do its work correctly
if (pr.assignee === null) {
  fail("Please assign someone to merge this PR, and optionally include people who should review.")
}

// Encourage smaller PRs
var bigPRThreshold = 600;
if (danger.github.pr.additions + danger.github.pr.deletions > bigPRThreshold) {
  warn(':exclamation: Big PR (' + ++errorCount + ')');
  markdown('> (' + errorCount + ') : Pull Request size seems relatively large. If Pull Request contains multiple changes, split each into separate PR will helps faster, easier review.');
}

// Always ensure we assign someone, so that our Slackbot can do its work correctly
if (pr.assignee === null) {
  fail("Please assign someone to merge this PR, and optionally include people who should review.")
}

// Pull request title validation
var prTitle = danger.github.pullRequest.title
if (prTitle.includes("WIP")) {
    warn("PR is classed as _Work in Progress_.")
}

// Encourage more testing
const hasAppChanges = modifiedAppFiles.length > 0;
const testChanges = modifiedAppFiles.filter(filepath => filepath.includes('test'));
const hasTestChanges = testChanges.length > 0;

// Warn if there are library changes, but not tests
if (hasAppChanges && !hasTestChanges) {
  warn(
    "There are library changes, but not tests. That's OK as long as you're refactoring existing code",
  );
}
