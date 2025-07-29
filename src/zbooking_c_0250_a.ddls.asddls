@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking - Consumption - Entity'
@Metadata.ignorePropagatedAnnotations: true


@Metadata.allowExtensions: true
@Search.searchable: true

define view entity ZBOOKING_C_0250_A
  as projection on ZBOOKING_R_0250_A
{
  key BookingUUID,
      TravelUUID,

      @Search.defaultSearchElement: true
      BookingID,

      BookingDate,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'CustomerName']
      @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Customer_StdVH',
                                                    element: 'CustomerID' },
                                                    useForValidation: true }] //Valida que el valor introducido por el usuario es valido
      CustomerID,
      _Customer.LastName        as CustomerName,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'CarrierName']
      @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Flight_StdVH',
                                                   element: 'AirlineID' },
                                                   additionalBinding: [{ localElement: 'ConnectionID', //Se crean ayudas de busquedas anidadas.
                                                                         element: 'ConnectionID',
                                                                         usage: #RESULT},

                                                                         { localElement: 'FlightDate',
                                                                         element: 'FlightDate',
                                                                         usage: #RESULT},

                                                                         { localElement: 'FlightPrice',
                                                                         element: 'Price',
                                                                         usage: #RESULT},

                                                                         { localElement: 'CurrencyCode',
                                                                         element: 'CurrencyCode',
                                                                         usage: #RESULT}

                                                                         ],
                                                                        useForValidation: true }] //Valida que el valor introducido por el usuario es valido
      AerlineID,
      _Carrier.Name             as CarrierName,

      @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Flight_StdVH',
                                                  element: 'ConnectionID' },
                                                  additionalBinding: [{ localElement: 'AerlineID', //Se crean ayudas de busquedas anidadas.
                                                                        element: 'AerlineID',
                                                                        usage: #FILTER_AND_RESULT},

                                                                        { localElement: 'FlightDate',
                                                                        element: 'FlightDate',
                                                                        usage: #RESULT},

                                                                        { localElement: 'FlightPrice',
                                                                        element: 'Price',
                                                                        usage: #RESULT},

                                                                        { localElement: 'CurrencyCode',
                                                                        element: 'CurrencyCode',
                                                                        usage: #RESULT}

                                                                        ],
                                                                        useForValidation: true }] //Valida que el valor introducido por el usuario es valido
      ConnectionID,

      @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Flight_StdVH',
                                                element: 'FlightDate' },
                                                additionalBinding: [{ localElement: 'AerlineID', //Se crean ayudas de busquedas anidadas.
                                                                      element: 'AerlineID',
                                                                      usage: #FILTER_AND_RESULT},

                                                                      { localElement: 'ConnectionID',
                                                                      element: 'ConnectionID',
                                                                      usage: #FILTER_AND_RESULT},

                                                                      { localElement: 'FlightPrice',
                                                                      element: 'Price',
                                                                      usage: #RESULT},

                                                                      { localElement: 'CurrencyCode',
                                                                      element: 'CurrencyCode',
                                                                      usage: #RESULT}

                                                                      ],
                                                                      useForValidation: true }] //Valida que el valor introducido por el usuario es valido

      FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Flight_StdVH',
                                              element: 'Price' },
                                              additionalBinding: [{ localElement: 'AerlineID', //Se crean ayudas de busquedas anidadas.
                                                                    element: 'AerlineID',
                                                                    usage: #FILTER_AND_RESULT},

                                                                    { localElement: 'ConnectionID',
                                                                    element: 'ConnectionID',
                                                                    usage: #FILTER_AND_RESULT},

                                                                    { localElement: 'FlightDate',
                                                                    element: 'FlightDate',
                                                                    usage: #FILTER_AND_RESULT},

                                                                    { localElement: 'CurrencyCode',
                                                                    element: 'CurrencyCode',
                                                                    usage: #RESULT}

                                                                    ],
                                                                    useForValidation: true }] //Valida que el valor introducido por el usuario es valido
      FlightPrice,

      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: {name: 'I_CurrencyStdVH',
                                                    element: 'Currency' },
                                                    useForValidation: true }] //Valida que el valor introducido por el usuario es valido
      CurrencyCode,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'BookingStatusText']
      @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Booking_Status_VH',
                                                    element: 'BookingStatus' },
                                                    useForValidation: true }] //Valida que el valor introducido por el usuario es valido
      BookingStatus,
      _BookingStatus._Text.Text as BookingStatusText : localized,

      LocalLastChangedAt,
      /* Associations */
      _BookingStatus,
      _BookingSuplement: redirected to composition child ZBKSUPPL_C_0250_A,
      _Carrier,
      _Connection,
      _Customer,
      _Travel:  redirected to parent ZTRAVEL_c_0250_A
}
