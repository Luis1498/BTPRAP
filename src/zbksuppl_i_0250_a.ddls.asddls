@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement - Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZBKSUPPL_I_0250_A
  as projection on ZBKSUPPL_r_0250_A
{
  key BooksupplUUID,
      TravelUUID,
      BookingUUID,
      BookingSupplementID,
      SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      /* Associations */
      _Booking: redirected to parent ZBOOKING_I_0250_A,
      _Product,
      _SupplementText,
      _Travel: redirected to ZTRAVEL_I_0250_A
}
