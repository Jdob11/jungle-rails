describe('Product Details', () => {

  beforeEach(() => {
    cy.visit('http://localhost:3000');
  });

  it("adds a product to the cart", () => {
    cy.get('a.nav-link')
      .contains('My Cart')
      .should('contain', 'My Cart (0)');
    cy.contains('Add').click()
    cy.get('a.nav-link')
      .contains('My Cart')
      .should('contain', 'My Cart (1)');
  });
})