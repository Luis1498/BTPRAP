@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking - Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZBOOKING_I_0250_A

  as projection on ZBOOKING_R_0250_A
{
  key BookingUUID,
      TravelUUID,
      BookingID,
      BookingDate,
      CustomerID,
      AerlineID,
      ConnectionID,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      LocalLastChangedAt,
      /* Associations */
      _BookingStatus,
      _BookingSuplement : redirected to composition child ZBKSUPPL_I_0250_A,
      _Carrier,
      _Connection,
      _Customer,
      _Travel           : redirected to parent ZTRAVEL_I_0250_A
}
