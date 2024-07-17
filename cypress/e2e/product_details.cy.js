describe('Product Details', () => {

  // it('visits the home page', () => {
  //   cy.visit('http://localhost:3000')
  // })

  beforeEach(() => {
    // Ensure each test starts from a known state (optional)
    cy.visit('http://localhost:3000');
  });

  it("Selects a product", () => {
    cy.get('.products > :nth-child(1)').click()
  });
})