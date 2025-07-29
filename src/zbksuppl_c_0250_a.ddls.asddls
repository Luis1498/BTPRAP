@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement - Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
@Search.searchable: true

define view entity ZBKSUPPL_C_0250_A
  as projection on ZBKSUPPL_r_0250_A
{
  key BooksupplUUID,
      TravelUUID,

      @Search.defaultSearchElement: true
      BookingUUID,

      BookingSupplementID,
      
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'SupplementDescription']
      @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Supplement_StdVH',
                                                   element: 'SupplementID' },
                                                   additionalBinding: [{ localElement: 'Price', //Se crean ayudas de busquedas anidadas.
                                                                         element: 'Price', 
                                                                         usage: #RESULT},

                                                                         { localElement: 'CurrencyCode',
                                                                         element: 'CurrencyCode',
                                                                         usage: #RESULT}

                                                                         ],
                                                                        useForValidation: true }] //Valida que el valor introducido por el usuario es valido
      SupplementID,
      _SupplementText.Description as SupplementDescription: localized,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,

      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: {name: 'I_CurrencyStdVH',
                                                    element: 'Currency' },
                                                    useForValidation: true }] //Valida que el valor introducido por el usuario es valido

      CurrencyCode,

      LocalLastChangedAt,
      /* Associations */
      _Booking: redirected to parent ZBOOKING_C_0250_A,
      _Product,
      _SupplementText,
      _Travel: redirected to ZTRAVEL_c_0250_A
}
