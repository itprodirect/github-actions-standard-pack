package consumer

import "testing"

func TestName(t *testing.T) {
    if Name() != "go-consumer" {
        t.Fatalf("unexpected name: %s", Name())
    }
}
