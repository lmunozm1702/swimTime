require "application_system_test_case"

class ProofsTest < ApplicationSystemTestCase
  setup do
    @proof = proofs(:one)
  end

  test "visiting the index" do
    visit proofs_url
    assert_selector "h1", text: "Proofs"
  end

  test "should create proof" do
    visit proofs_url
    click_on "New proof"

    fill_in "Distance", with: @proof.distance
    fill_in "Style", with: @proof.style
    click_on "Create Proof"

    assert_text "Proof was successfully created"
    click_on "Back"
  end

  test "should update Proof" do
    visit proof_url(@proof)
    click_on "Edit this proof", match: :first

    fill_in "Distance", with: @proof.distance
    fill_in "Style", with: @proof.style
    click_on "Update Proof"

    assert_text "Proof was successfully updated"
    click_on "Back"
  end

  test "should destroy Proof" do
    visit proof_url(@proof)
    click_on "Destroy this proof", match: :first

    assert_text "Proof was successfully destroyed"
  end
end
