require "application_system_test_case"

class MaterialsTest < ApplicationSystemTestCase
  setup do
    @material = materials(:one)
  end

  test "visiting the index" do
    visit materials_url
    assert_selector "h1", text: "Materials"
  end

  test "creating a Material" do
    visit materials_url
    click_on "New Material"

    fill_in "Name", with: @material.name
    fill_in "Unit price", with: @material.unit_price
    fill_in "Unit size", with: @material.unit_size
    click_on "Create Material"

    assert_text "Material was successfully created"
    assert_selector "h1", text: "Materials"
  end

  test "updating a Material" do
    visit material_url(@material)
    click_on "Edit", match: :first

    fill_in "Name", with: @material.name
    fill_in "Unit price", with: @material.unit_price
    fill_in "Unit size", with: @material.unit_size
    click_on "Update Material"

    assert_text "Material was successfully updated"
    assert_selector "h1", text: "Materials"
  end

  test "destroying a Material" do
    visit edit_material_url(@material)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Material was successfully destroyed"
  end
end
