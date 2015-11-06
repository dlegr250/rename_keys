require "spec_helper"

describe CoreExtensions::Hash::Keys do
  it "has a version number" do
    expect(RenameKeys::VERSION).not_to be nil
  end

  context "Hash#rename_keys" do
    it "changes key names to new keys" do
      initial_hash = { "a" => "first" }

      renamed_hash = initial_hash.rename_keys({ "a" => "alpha" })

      expect(renamed_hash.size).to eq(1)
      expect(renamed_hash["alpha"]).to eq("first")
    end

    it "changes key names for deep/nested hashes" do
      initial_hash = {
        "a" => {
          "b" => {
            "c" => "third"
          }
        }
      }

      renamed_hash = initial_hash.rename_keys({ "c" => "charlie" })

      expect(renamed_hash["a"]["b"]["charlie"]).to eq("third")
    end
  end

  context "Array#rename_keys" do
    it "changes key names for an array of hashes" do
      initial_hashes = [
        { "a" => "first" },
        { "b" => "second" },
        { "c" => "third" }
      ]

      renamed_hashes = initial_hashes.rename_keys({ "a" => "alpha", "b" => "bravo", "c" => "charlie" })

      expect(renamed_hashes.size).to eq(3)
      expect(renamed_hashes[0]).to eq({ "alpha" => "first" })
      expect(renamed_hashes[1]).to eq({ "bravo" => "second" })
      expect(renamed_hashes[2]).to eq({ "charlie" => "third" })
    end

    it "does not alter non-hash elements" do
      original_array = [
        { "a" => "first" },
        2
      ]

      renamed_array = original_array.rename_keys({ "a" => "alpha" })

      expect(renamed_array.size).to eq(2)
      expect(renamed_array[0]).to eq({ "alpha" => "first" })
      expect(renamed_array[1]).to eq(2)
    end
  end
end
