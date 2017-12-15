package main

import (
	"encoding/json"
	"testing"
)

func TestMonetaryValue(t *testing.T) {

	money := &MonetaryValue{
		1234,
		456,
		"GBP",
	}

	expectedResult := "1234.456"
	actualResult := money.StringValue()
	if expectedResult != actualResult {
		t.Fatalf("Expected: %v Got: %v", expectedResult, actualResult)
	}

}

func TestLedgerEntry(t *testing.T) {

	money := &MonetaryValue{
		1234,
		456,
		"GBP",
	}

	ledgerEntry := &LedgerEntry{
		*money,
		"Unspent",
	}

	encoding, err := json.Marshal(ledgerEntry)
	if err != nil {
		t.Fatalf("Failed to marshal ledgerEntry")
	}

	expectedResult := `{"amount":{"value":1234,"fraction":456,"currency":"GBP"},"beneficiary":"Unspent"}`
	actualResult := string(encoding)

	if actualResult != expectedResult {
		t.Fatalf("Expected: %v Got: %v", expectedResult, actualResult)
	}

}

func TestLedger(t *testing.T) {

	money := &MonetaryValue{
		1234,
		456,
		"GBP",
	}

	ledgerEntry := &LedgerEntry{
		*money,
		"Unspent",
	}

	ledger := &Ledger{
		[]LedgerEntry{
			*ledgerEntry,
		},
	}

	encoding, err := json.Marshal(ledger)
	if err != nil {
		t.Fatalf("Json marshal failed")
	}

	expectedResult := `{"entries":[{"amount":{"value":1234,"fraction":456,"currency":"GBP"},"beneficiary":"Unspent"}]}`
	actualResult := string(encoding)
	if actualResult != expectedResult {
		t.Fatalf("Expected: %v Got: %v", expectedResult, actualResult)
	}
}
