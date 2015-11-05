require "spec_helper"

describe CoreExtensions::Hash::Keys do
  it "has a version number" do
    expect(RenameKeys::VERSION).not_to be nil
  end

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
