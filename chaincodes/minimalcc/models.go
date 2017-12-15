package main

import (
	"fmt"
)

type MonetaryValue struct {
	Value           int64  `json:"value"`
	FractionalValue uint64 `json:"fraction"`
	Currency        string `json:"currency"`
}

func (t *MonetaryValue) StringValue() string {
	return fmt.Sprintf("%v.%v", t.Value, t.FractionalValue)
}

type LedgerEntry struct {
	Amount      MonetaryValue `json:"amount"`
	Beneficiary string        `json:"beneficiary"`
}

type Ledger struct {
	Entries []LedgerEntry `json:"entries"`
}
