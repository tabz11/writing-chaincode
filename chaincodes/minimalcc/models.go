package main

type LedgerItem struct {
	Identifier  string `json:"identifier"`
	Label       string `json:"label"`
	Description string `json:"description"`
}

type LedgerEntry struct {
	LedgerItem
	Owner string `json:"owner"`
}

type Ledger struct {
	Entries []LedgerEntry
}
