package main

import (
	"testing"
)

func TestLedgerInstantiation(t *testing.T) {

	item := LedgerItem{"Identifier", "Label", "Description"}
	entry := LedgerEntry{item, "owner1"}
	ledger := new(Ledger)
	ledger.Entries = []LedgerEntry{
		entry,
	}

	actualLedger := ledger
	expectedOwner := "owner1"

	if actualLedger.Entries[0].Owner != expectedOwner {
		t.Fatalf(`Expected: %v Got: %v`, expectedOwner, actualLedger.Entries[0].Owner)
	}

	if actualLedger.Entries[0] != entry {
		t.Fatalf("Expected: %v Got: %v", actualLedger.Entries[0], entry)
	}

}
