DROP TABLE vb_vb_istvpkfgk4j.xxgstt_arss_inv_req_lines_int;

CREATE TABLE vb_vb_istvpkfgk4j.xxgstt_arss_inv_req_lines_int (
    oic_flow_id                      NUMBER(15,0),
    arss_invoice_reference           VARCHAR2(30 BYTE),
    arss_invoice_id                  VARCHAR2(30 BYTE),
	arss_invoice_line_id             VARCHAR2(30 BYTE),
	bu_name                          VARCHAR2(150 BYTE),
	fbdi_string                      VARCHAR2(10000 BYTE),
    interface_line_id                NUMBER(15,0),
    interface_line_context           VARCHAR2(30 BYTE),
    interface_line_attribute1        VARCHAR2(150 BYTE),
    interface_line_attribute2        VARCHAR2(150 BYTE),
    interface_line_attribute3        VARCHAR2(150 BYTE),
    interface_line_attribute4        VARCHAR2(150 BYTE),
    interface_line_attribute5        VARCHAR2(150 BYTE),
    interface_line_attribute6        VARCHAR2(150 BYTE),
    interface_line_attribute7        VARCHAR2(150 BYTE),
    interface_line_attribute8        VARCHAR2(150 BYTE),
    batch_source_name                VARCHAR2(50 BYTE)
        NOT NULL ENABLE,
    set_of_books_id                  NUMBER(15,0),
    line_type                        VARCHAR2(20 BYTE)
        NOT NULL ENABLE,
    description                      VARCHAR2(240 BYTE)
        NOT NULL ENABLE,
    currency_code                    VARCHAR2(15 BYTE)
        NOT NULL ENABLE,
    amount                           NUMBER,
    cust_trx_type_name               VARCHAR2(20 BYTE),
    cust_trx_type_id                 NUMBER(15,0),
    term_name                        VARCHAR2(15 BYTE),
    term_id                          NUMBER(15,0),
    orig_system_batch_name           VARCHAR2(40 BYTE),
    orig_system_bill_customer_ref    VARCHAR2(240 BYTE),
    orig_system_bill_customer_id     NUMBER(15,0),
    orig_system_bill_address_ref     VARCHAR2(240 BYTE),
    orig_system_bill_address_id      NUMBER(15,0),
    orig_system_bill_contact_ref     VARCHAR2(240 BYTE),
    orig_system_bill_contact_id      NUMBER(15,0),
    orig_system_ship_customer_ref    VARCHAR2(240 BYTE),
    orig_system_ship_customer_id     NUMBER(15,0),
    orig_system_ship_address_ref     VARCHAR2(240 BYTE),
    orig_system_ship_address_id      NUMBER(15,0),
    orig_system_ship_contact_ref     VARCHAR2(240 BYTE),
    orig_system_ship_contact_id      NUMBER(15,0),
    orig_system_sold_customer_ref    VARCHAR2(240 BYTE),
    orig_system_sold_customer_id     NUMBER(15,0),
    link_to_line_id                  NUMBER(15,0),
    link_to_line_context             VARCHAR2(30 BYTE),
    link_to_line_attribute1          VARCHAR2(150 BYTE),
    link_to_line_attribute2          VARCHAR2(150 BYTE),
    link_to_line_attribute3          VARCHAR2(150 BYTE),
    link_to_line_attribute4          VARCHAR2(150 BYTE),
    link_to_line_attribute5          VARCHAR2(150 BYTE),
    link_to_line_attribute6          VARCHAR2(150 BYTE),
    link_to_line_attribute7          VARCHAR2(150 BYTE),
    receipt_method_name              VARCHAR2(30 BYTE),
    receipt_method_id                NUMBER(15,0),
    conversion_type                  VARCHAR2(30 BYTE)
        NOT NULL ENABLE,
    conversion_date                  DATE,
    conversion_rate                  NUMBER,
    customer_trx_id                  NUMBER(15,0),
    trx_date                         DATE,
    gl_date                          DATE,
    document_number                  NUMBER(15,0),
    trx_number                       VARCHAR2(20 BYTE),
    line_number                      NUMBER(15,0),
    quantity                         NUMBER,
    quantity_ordered                 NUMBER,
    unit_selling_price               NUMBER,
    unit_standard_price              NUMBER,
    printing_option                  VARCHAR2(20 BYTE),
    interface_status                 VARCHAR2(1 BYTE),
    request_id                       NUMBER(15,0),
    related_batch_source_name        VARCHAR2(50 BYTE),
    related_trx_number               VARCHAR2(20 BYTE),
    related_customer_trx_id          NUMBER(15,0),
    previous_customer_trx_id         NUMBER(15,0),
    credit_method_for_acct_rule      VARCHAR2(30 BYTE),
    credit_method_for_installments   VARCHAR2(30 BYTE),
    reason_code                      VARCHAR2(30 BYTE),
    tax_rate                         NUMBER,
    tax_code                         VARCHAR2(50 BYTE),
    tax_precedence                   NUMBER,
    exception_id                     NUMBER(15,0),
    exemption_id                     NUMBER(15,0),
    ship_date_actual                 DATE,
    fob_point                        VARCHAR2(30 BYTE),
    ship_via                         VARCHAR2(25 BYTE),
    waybill_number                   VARCHAR2(50 BYTE),
    invoicing_rule_name              VARCHAR2(30 BYTE),
    invoicing_rule_id                NUMBER(15,0),
    accounting_rule_name             VARCHAR2(30 BYTE),
    accounting_rule_id               NUMBER(15,0),
    accounting_rule_duration         NUMBER(15,0),
    rule_start_date                  DATE,
    primary_salesrep_number          VARCHAR2(30 BYTE),
    primary_salesrep_id              NUMBER(15,0),
    sales_order                      VARCHAR2(50 BYTE),
    sales_order_line                 VARCHAR2(30 BYTE),
    sales_order_date                 DATE,
    sales_order_source               VARCHAR2(50 BYTE),
    sales_order_revision             NUMBER,
    purchase_order                   VARCHAR2(50 BYTE),
    purchase_order_revision          VARCHAR2(50 BYTE),
    purchase_order_date              DATE,
    agreement_name                   VARCHAR2(30 BYTE),
    agreement_id                     NUMBER(15,0),
    memo_line_name                   VARCHAR2(50 BYTE),
    memo_line_id                     NUMBER(15,0),
    inventory_item_id                NUMBER(15,0),
    mtl_system_items_seg1            VARCHAR2(40 BYTE),
    mtl_system_items_seg2            VARCHAR2(40 BYTE),
    mtl_system_items_seg3            VARCHAR2(40 BYTE),
    mtl_system_items_seg4            VARCHAR2(40 BYTE),
    mtl_system_items_seg5            VARCHAR2(40 BYTE),
    mtl_system_items_seg6            VARCHAR2(40 BYTE),
    mtl_system_items_seg7            VARCHAR2(40 BYTE),
    mtl_system_items_seg8            VARCHAR2(40 BYTE),
    mtl_system_items_seg9            VARCHAR2(40 BYTE),
    mtl_system_items_seg10           VARCHAR2(40 BYTE),
    mtl_system_items_seg11           VARCHAR2(40 BYTE),
    mtl_system_items_seg12           VARCHAR2(40 BYTE),
    mtl_system_items_seg13           VARCHAR2(40 BYTE),
    mtl_system_items_seg14           VARCHAR2(40 BYTE),
    mtl_system_items_seg15           VARCHAR2(40 BYTE),
    mtl_system_items_seg16           VARCHAR2(40 BYTE),
    mtl_system_items_seg17           VARCHAR2(40 BYTE),
    mtl_system_items_seg18           VARCHAR2(40 BYTE),
    mtl_system_items_seg19           VARCHAR2(40 BYTE),
    mtl_system_items_seg20           VARCHAR2(40 BYTE),
    reference_line_id                NUMBER(15,0),
    reference_line_context           VARCHAR2(30 BYTE),
    reference_line_attribute1        VARCHAR2(150 BYTE),
    reference_line_attribute2        VARCHAR2(150 BYTE),
    reference_line_attribute3        VARCHAR2(150 BYTE),
    reference_line_attribute4        VARCHAR2(150 BYTE),
    reference_line_attribute5        VARCHAR2(150 BYTE),
    reference_line_attribute6        VARCHAR2(150 BYTE),
    reference_line_attribute7        VARCHAR2(150 BYTE),
    territory_id                     NUMBER(15,0),
    territory_segment1               VARCHAR2(25 BYTE),
    territory_segment2               VARCHAR2(25 BYTE),
    territory_segment3               VARCHAR2(25 BYTE),
    territory_segment4               VARCHAR2(25 BYTE),
    territory_segment5               VARCHAR2(25 BYTE),
    territory_segment6               VARCHAR2(25 BYTE),
    territory_segment7               VARCHAR2(25 BYTE),
    territory_segment8               VARCHAR2(25 BYTE),
    territory_segment9               VARCHAR2(25 BYTE),
    territory_segment10              VARCHAR2(25 BYTE),
    territory_segment11              VARCHAR2(25 BYTE),
    territory_segment12              VARCHAR2(25 BYTE),
    territory_segment13              VARCHAR2(25 BYTE),
    territory_segment14              VARCHAR2(25 BYTE),
    territory_segment15              VARCHAR2(25 BYTE),
    territory_segment16              VARCHAR2(25 BYTE),
    territory_segment17              VARCHAR2(25 BYTE),
    territory_segment18              VARCHAR2(25 BYTE),
    territory_segment19              VARCHAR2(25 BYTE),
    territory_segment20              VARCHAR2(25 BYTE),
    attribute_category               VARCHAR2(30 BYTE),
    attribute1                       VARCHAR2(150 BYTE),
    attribute2                       VARCHAR2(150 BYTE),
    attribute3                       VARCHAR2(150 BYTE),
    attribute4                       VARCHAR2(150 BYTE),
    attribute5                       VARCHAR2(150 BYTE),
    attribute6                       VARCHAR2(150 BYTE),
    attribute7                       VARCHAR2(150 BYTE),
    attribute8                       VARCHAR2(150 BYTE),
    attribute9                       VARCHAR2(150 BYTE),
    attribute10                      VARCHAR2(150 BYTE),
    attribute11                      VARCHAR2(150 BYTE),
    attribute12                      VARCHAR2(150 BYTE),
    attribute13                      VARCHAR2(150 BYTE),
    attribute14                      VARCHAR2(150 BYTE),
    attribute15                      VARCHAR2(150 BYTE),
    header_attribute_category        VARCHAR2(30 BYTE),
    header_attribute1                VARCHAR2(150 BYTE),
    header_attribute2                VARCHAR2(150 BYTE),
    header_attribute3                VARCHAR2(150 BYTE),
    header_attribute4                VARCHAR2(150 BYTE),
    header_attribute5                VARCHAR2(150 BYTE),
    header_attribute6                VARCHAR2(150 BYTE),
    header_attribute7                VARCHAR2(150 BYTE),
    header_attribute8                VARCHAR2(150 BYTE),
    header_attribute9                VARCHAR2(150 BYTE),
    header_attribute10               VARCHAR2(150 BYTE),
    header_attribute11               VARCHAR2(150 BYTE),
    header_attribute12               VARCHAR2(150 BYTE),
    header_attribute13               VARCHAR2(150 BYTE),
    header_attribute14               VARCHAR2(150 BYTE),
    header_attribute15               VARCHAR2(150 BYTE),
    comments                         VARCHAR2(240 BYTE),
    internal_notes                   VARCHAR2(240 BYTE),
    initial_customer_trx_id          NUMBER(15,0),
    ussgl_transaction_code_context   VARCHAR2(30 BYTE),
    ussgl_transaction_code           VARCHAR2(30 BYTE),
    acctd_amount                     NUMBER,
    customer_bank_account_id         NUMBER(15,0),
    customer_bank_account_name       VARCHAR2(80 BYTE),
    uom_code                         VARCHAR2(3 BYTE),
    uom_name                         VARCHAR2(25 BYTE),
    document_number_sequence_id      NUMBER(15,0),
    link_to_line_attribute10         VARCHAR2(150 BYTE),
    link_to_line_attribute11         VARCHAR2(150 BYTE),
    link_to_line_attribute12         VARCHAR2(150 BYTE),
    link_to_line_attribute13         VARCHAR2(150 BYTE),
    link_to_line_attribute14         VARCHAR2(150 BYTE),
    link_to_line_attribute15         VARCHAR2(150 BYTE),
    link_to_line_attribute8          VARCHAR2(150 BYTE),
    link_to_line_attribute9          VARCHAR2(150 BYTE),
    reference_line_attribute10       VARCHAR2(150 BYTE),
    reference_line_attribute11       VARCHAR2(150 BYTE),
    reference_line_attribute12       VARCHAR2(150 BYTE),
    reference_line_attribute13       VARCHAR2(150 BYTE),
    reference_line_attribute14       VARCHAR2(150 BYTE),
    reference_line_attribute15       VARCHAR2(150 BYTE),
    reference_line_attribute8        VARCHAR2(150 BYTE),
    reference_line_attribute9        VARCHAR2(150 BYTE),
    interface_line_attribute10       VARCHAR2(150 BYTE),
    interface_line_attribute11       VARCHAR2(150 BYTE),
    interface_line_attribute12       VARCHAR2(150 BYTE),
    interface_line_attribute13       VARCHAR2(150 BYTE),
    interface_line_attribute14       VARCHAR2(150 BYTE),
    interface_line_attribute15       VARCHAR2(150 BYTE),
    interface_line_attribute9        VARCHAR2(150 BYTE),
    vat_tax_id                       NUMBER(15,0),
    reason_code_meaning              VARCHAR2(80 BYTE),
    last_period_to_credit            NUMBER,
    paying_customer_id               NUMBER(15,0),
    paying_site_use_id               NUMBER(15,0),
    tax_exempt_flag                  VARCHAR2(1 BYTE),
    tax_exempt_reason_code           VARCHAR2(30 BYTE),
    tax_exempt_reason_code_meaning   VARCHAR2(80 BYTE),
    tax_exempt_number                VARCHAR2(80 BYTE),
    sales_tax_id                     NUMBER(15,0),
    created_by                       VARCHAR2(150 BYTE),
    creation_date                    DATE,
    last_updated_by                  VARCHAR2(150 BYTE),
    last_update_date                 DATE,
    last_update_login                NUMBER(15,0),
    location_segment_id              NUMBER(15,0),
    movement_id                      NUMBER(15,0),
    org_id                           NUMBER(15,0) DEFAULT NULL,
    amount_includes_tax_flag         VARCHAR2(1 BYTE),
    header_gdf_attr_category         VARCHAR2(30 BYTE),
    header_gdf_attribute1            VARCHAR2(150 BYTE),
    header_gdf_attribute2            VARCHAR2(150 BYTE),
    header_gdf_attribute3            VARCHAR2(150 BYTE),
    header_gdf_attribute4            VARCHAR2(150 BYTE),
    header_gdf_attribute5            VARCHAR2(150 BYTE),
    header_gdf_attribute6            VARCHAR2(150 BYTE),
    header_gdf_attribute7            VARCHAR2(150 BYTE),
    header_gdf_attribute8            VARCHAR2(150 BYTE),
    header_gdf_attribute9            VARCHAR2(150 BYTE),
    header_gdf_attribute10           VARCHAR2(150 BYTE),
    header_gdf_attribute11           VARCHAR2(150 BYTE),
    header_gdf_attribute12           VARCHAR2(150 BYTE),
    header_gdf_attribute13           VARCHAR2(150 BYTE),
    header_gdf_attribute14           VARCHAR2(150 BYTE),
    header_gdf_attribute15           VARCHAR2(150 BYTE),
    header_gdf_attribute16           VARCHAR2(150 BYTE),
    header_gdf_attribute17           VARCHAR2(150 BYTE),
    header_gdf_attribute18           VARCHAR2(150 BYTE),
    header_gdf_attribute19           VARCHAR2(150 BYTE),
    header_gdf_attribute20           VARCHAR2(150 BYTE),
    header_gdf_attribute21           VARCHAR2(150 BYTE),
    header_gdf_attribute22           VARCHAR2(150 BYTE),
    header_gdf_attribute23           VARCHAR2(150 BYTE),
    header_gdf_attribute24           VARCHAR2(150 BYTE),
    header_gdf_attribute25           VARCHAR2(150 BYTE),
    header_gdf_attribute26           VARCHAR2(150 BYTE),
    header_gdf_attribute27           VARCHAR2(150 BYTE),
    header_gdf_attribute28           VARCHAR2(150 BYTE),
    header_gdf_attribute29           VARCHAR2(150 BYTE),
    header_gdf_attribute30           VARCHAR2(150 BYTE),
    line_gdf_attr_category           VARCHAR2(30 BYTE),
    line_gdf_attribute1              VARCHAR2(150 BYTE),
    line_gdf_attribute2              VARCHAR2(150 BYTE),
    line_gdf_attribute3              VARCHAR2(150 BYTE),
    line_gdf_attribute4              VARCHAR2(150 BYTE),
    line_gdf_attribute5              VARCHAR2(150 BYTE),
    line_gdf_attribute6              VARCHAR2(150 BYTE),
    line_gdf_attribute7              VARCHAR2(150 BYTE),
    line_gdf_attribute8              VARCHAR2(150 BYTE),
    line_gdf_attribute9              VARCHAR2(150 BYTE),
    line_gdf_attribute10             VARCHAR2(150 BYTE),
    line_gdf_attribute11             VARCHAR2(150 BYTE),
    line_gdf_attribute12             VARCHAR2(150 BYTE),
    line_gdf_attribute13             VARCHAR2(150 BYTE),
    line_gdf_attribute14             VARCHAR2(150 BYTE),
    line_gdf_attribute15             VARCHAR2(150 BYTE),
    line_gdf_attribute16             VARCHAR2(150 BYTE),
    line_gdf_attribute17             VARCHAR2(150 BYTE),
    line_gdf_attribute18             VARCHAR2(150 BYTE),
    line_gdf_attribute19             VARCHAR2(150 BYTE),
    line_gdf_attribute20             VARCHAR2(150 BYTE),
    reset_trx_date_flag              VARCHAR2(1 BYTE),
    payment_server_order_num         VARCHAR2(80 BYTE),
    approval_code                    VARCHAR2(80 BYTE),
    address_verification_code        VARCHAR2(80 BYTE),
    warehouse_id                     NUMBER(15,0),
    translated_description           VARCHAR2(1000 BYTE),
    cons_billing_number              VARCHAR2(30 BYTE),
    promised_commitment_amount       NUMBER,
    payment_set_id                   NUMBER(15,0),
    original_gl_date                 DATE,
    contract_line_id                 NUMBER,
    contract_id                      NUMBER,
    source_data_key1                 VARCHAR2(150 BYTE),
    source_data_key2                 VARCHAR2(150 BYTE),
    source_data_key3                 VARCHAR2(150 BYTE),
    source_data_key4                 VARCHAR2(150 BYTE),
    source_data_key5                 VARCHAR2(150 BYTE),
    invoiced_line_acctg_level        VARCHAR2(15 BYTE),
    override_auto_accounting_flag    VARCHAR2(1 BYTE),
    source_application_id            NUMBER(15,0),
    source_event_class_code          VARCHAR2(30 BYTE),
    source_entity_code               VARCHAR2(30 BYTE),
    source_trx_id                    NUMBER,
    source_trx_line_id               NUMBER,
    source_trx_line_type             VARCHAR2(30 BYTE),
    source_trx_detail_tax_line_id    NUMBER(15,0),
    historical_flag                  VARCHAR2(1 BYTE),
    tax_regime_code                  VARCHAR2(30 BYTE),
    tax                              VARCHAR2(30 BYTE),
    tax_status_code                  VARCHAR2(30 BYTE),
    tax_rate_code                    VARCHAR2(30 BYTE),
    tax_jurisdiction_code            VARCHAR2(30 BYTE),
    taxable_amount                   NUMBER,
    taxable_flag                     VARCHAR2(1 BYTE),
    legal_entity_id                  NUMBER(15,0),
    parent_line_id                   NUMBER(15,0),
    deferral_exclusion_flag          VARCHAR2(1 BYTE),
    payment_trxn_extension_id        NUMBER(15,0),
    rule_end_date                    DATE,
    payment_attributes               VARCHAR2(1000 BYTE),
    application_id                   NUMBER(15,0),
    billing_date                     DATE,
    trx_business_category            VARCHAR2(240 BYTE),
    product_fisc_classification      VARCHAR2(240 BYTE),
    product_category                 VARCHAR2(240 BYTE),
    product_type                     VARCHAR2(240 BYTE),
    line_intended_use                VARCHAR2(240 BYTE),
    assessable_value                 NUMBER,
    document_sub_type                VARCHAR2(240 BYTE),
    default_taxation_country         VARCHAR2(2 BYTE),
    user_defined_fisc_class          VARCHAR2(30 BYTE),
    taxed_upstream_flag              VARCHAR2(1 BYTE),
    tax_invoice_date                 DATE,
    tax_invoice_number               VARCHAR2(150 BYTE),
    payment_type_code                VARCHAR2(30 BYTE),
    mandate_last_trx_flag            VARCHAR2(1 BYTE),
    CONSTRAINT ra_interface_lines_c1 CHECK ( tax_exempt_flag IN (
        'S',
        'E',
        'R',
        'O'
    ) ) ENABLE
);

/

SHOW ERR;