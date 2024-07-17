describe('Product Details', () => {

  beforeEach(() => {
    cy.visit('http://localhost:3000');
  });

  it("Selects a product", () => {
    cy.get('.products > :nth-child(1)').click()
  });
})