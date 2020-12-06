---EXECUTE ORDS.DELETE_MODULE(p_module_name=>'xxgstt_arss_invoice_request');
BEGIN
    ords.delete_module(p_module_name => 'xxgstt_arss_invoice_request');
    ords.define_module(p_module_name => 'xxgstt_arss_invoice_request', p_base_path => 'xxgstt_arss_invoice_request/',
                      p_items_per_page => 0);

    ords.define_template(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'get_invoice_reference/');
    ords.define_handler(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'get_invoice_reference/',
                       p_method => 'GET',
                       p_source_type => ords.source_type_collection_feed,
                       p_source => 'select arss.xxgstt_inv_req_ref_seq.nextval from dual',
                       p_items_per_page => 0);

    ords.define_template(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'get_approvers/');
    ords.define_handler(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'get_approvers/',
                       p_method => 'GET',
                       p_source_type => ords.source_type_collection_feed,
                       p_source => 'select * from vb_vb_istvpkfgk4j.approvalhierarchy',
                       p_items_per_page => 0);

    ords.define_template(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'get_approvers/:requestor');
    ords.define_handler(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'get_approvers/:requestor',
                       p_method => 'GET',
                       p_source_type => ords.source_type_collection_feed,
                       p_source => 'select * from vb_vb_istvpkfgk4j.approvalhierarchy where requestor = :requestor',
                       p_items_per_page => 0);

    ords.define_template(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'duplicate_invoice/:inv_id/:requestor');
    ords.define_handler(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'duplicate_invoice/:inv_id/:requestor',
                       p_method => 'POST',
                       p_source_type => ords.source_type_plsql,
                       p_source => 'BEGIN
                           arss.xxgstt_arss_invoice_request.duplicate_invoice(p_in_inv_id    => :inv_id,
                                           p_in_requestor    => :requestor);
                         END;',
                       p_items_per_page => 0);

    ords.define_template(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'update_approver/:inv_id/:currentapprover');
    ords.define_handler(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'update_approver/:inv_id/:currentapprover',
                       p_method => 'GET',
                       p_source_type => ords.source_type_plsql,
                       p_source => 'BEGIN
                           arss.xxgstt_arss_invoice_request.update_approver(
						                   p_in_inv_id    => :inv_id,
										   p_in_current_approver    => :currentapprover);
                         END;',
                       p_items_per_page => 0);

    ords.define_template(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'update_invoice_status/:inv_id/:inv_status');
    ords.define_handler(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'update_invoice_status/:inv_id/:inv_status',
                       p_method => 'GET',
                       p_source_type => ords.source_type_plsql,
                       p_source => 'BEGIN
                           arss.xxgstt_arss_invoice_request.update_invoice_status(
						                   p_in_inv_id    => :inv_id,
										   p_in_inv_status    => :inv_status);
                         END;',
                       p_items_per_page => 0);
					   
	ords.define_template(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'get_distribution_defaults/:inv_id/:inv_line_id');
    ords.define_handler(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'get_distribution_defaults/:inv_id/:inv_line_id',
                       p_method => 'GET',
                       p_source_type => ords.source_type_plsql,
                       p_source => 'BEGIN
                           arss.xxgstt_arss_invoice_request.get_distribution_defaults(
						                   p_in_inv_id    => :inv_id,
										   p_in_inv_line_id    => :inv_line_id);
                         END;',
                       p_items_per_page => 0);				   

	ords.define_template(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'update_transaction_total/:inv_id');
    ords.define_handler(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'update_transaction_total/:inv_id',
                       p_method => 'GET',
                       p_source_type => ords.source_type_plsql,
                       p_source => 'BEGIN
                           arss.xxgstt_arss_invoice_request.update_transaction_total(
						                   p_in_inv_id    => :inv_id);
                         END;',
                       p_items_per_page => 0);	
					   
    ords.define_template(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'update_invoice/:inv_id/:inv_status/:currentapprover');
    ords.define_handler(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'update_invoice/:inv_id/:inv_status/:currentapprover',
                       p_method => 'GET',
                       p_source_type => ords.source_type_plsql,
                       p_source => 'BEGIN
                           arss.xxgstt_arss_invoice_request.update_invoice(
						                   p_in_inv_id    => :inv_id,
                                           p_in_inv_status    => :inv_status,
										   p_in_current_approver    => :currentapprover);
                         END;',
                       p_items_per_page => 0);

    ords.define_template(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'get_new_invoice_id/:old_invoice_id');
    ords.define_handler(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'get_new_invoice_id/:old_invoice_id',
                       p_method => 'GET',
                       p_source_type => ords.source_type_collection_item,
                       p_source => 'select max(id) new_invoice_id from vb_vb_istvpkfgk4j.invoiceheader where copiedFromInvId = :old_invoice_id',
                       p_items_per_page => 0);

    ords.define_template(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'get_invoice_lines/:invoice_id');
    ords.define_handler(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'get_invoice_lines/:invoice_id',
                       p_method => 'GET',
                       p_source_type => ords.source_type_collection_feed,
                       p_source => 'SELECT
    description,
    quantity,
    unitprice,
    t.name taxcode,
    organization
    || ''.''
    || costcentre
    || ''.''
    || subjective
    || ''.''
    || wga
    || ''.''
    || intercompany
    || ''.''
    || analysis
    || ''.''
    || spare1
    || ''.''
    || spare2 code_combination
FROM
    vb_vb_istvpkfgk4j.invoiceline l,
    vb_vb_istvpkfgk4j.invoicedistribution d,
	vb_vb_istvpkfgk4j.taxcode t
WHERE
    l.invoiceheaderid = :invoice_id
    AND l.invoiceheaderid = d.invoiceheaderid
    AND l.id = d.invoicelineid
	AND l.taxcode = t.id',
                       p_items_per_page => 0);

    COMMIT;
END;
/

updateInvoiceReqPayload

https://foizja9l9puedqg-gsttadwdev.adb.uk-london-1.oraclecloudapps.com/ords/arss/xxgstt_arss_invoice_request/update_transaction_total/{inv_id}

https://foizja9l9puedqg-gsttadwdev.adb.uk-london-1.oraclecloudapps.com/ords/arss/xxgstt_arss_invoice_request/get_distribution_defaults/{inv_id}/{inv_line_id}

https://foizja9l9puedqg-gsttadwdev.adb.uk-london-1.oraclecloudapps.com/ords/arss/xxgstt_arss_invoice_request/get_distribution_defaults/1000015/2000017

https://foizja9l9puedqg-gsttadwdev.adb.uk-london-1.oraclecloudapps.com/ords/arss/xxgstt_arss_invoice_request/update_invoice_status/{inv_id}/{inv_status}

https://foizja9l9puedqg-gsttadwdev.adb.uk-london-1.oraclecloudapps.com/ords/arss/xxgstt_arss_invoice_request/update_approver/{inv_id}/{currentapprover}

https://foizja9l9puedqg-gsttadwdev.adb.uk-london-1.oraclecloudapps.com/ords/arss/xxgstt_arss_invoice_request/duplicate_invoice/{inv_id}/{requestor}

https://foizja9l9puedqg-gsttadwdev.adb.uk-london-1.oraclecloudapps.com/ords/arss/xxgstt_arss_invoice_request/get_invoice_reference/

https://foizja9l9puedqg-gsttadwdev.adb.uk-london-1.oraclecloudapps.com/ords/arss/xxgstt_arss_invoice_request/get_approvers/:requestor

https://foizja9l9puedqg-gsttadwdev.adb.uk-london-1.oraclecloudapps.com/ords/arss/xxgstt_arss_invoice_request/get_new_invoice_id/:old_invoice_id

https://foizja9l9puedqg-gsttadwdev.adb.uk-london-1.oraclecloudapps.com/ords/arss/xxgstt_arss_invoice_request/get_invoice_lines/:invoice_id


***************************************************************************************************************************************

BEGIN

    ords.define_template(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'get_distribution_defaults/:inv_id/:inv_line_id');
    ords.define_handler(p_module_name => 'xxgstt_arss_invoice_request', p_pattern => 'get_distribution_defaults/:inv_id/:inv_line_id',
                       p_method => 'GET',
                       p_source_type => ords.source_type_plsql,
                       p_source => 'BEGIN
                           arss.xxgstt_arss_invoice_request.get_distribution_defaults(
						                   p_in_inv_id    => :inv_id,
										   p_in_inv_line_id    => :inv_line_id);
                         END;',
                       p_items_per_page => 0);
    
  COMMIT;
END;
/

OLD:

https://foizja9l9puedqg-gsttadwdev.adb.uk-london-1.oraclecloudapps.com/ords/admin/arss/xxgstt_arss_invoice_request/get_invoice_reference/

https://foizja9l9puedqg-gsttadwdev.adb.uk-london-1.oraclecloudapps.com/ords/admin/arss/xxgstt_arss_invoice_request/get_approvers/:requestor

https://foizja9l9puedqg-gsttadwdev.adb.uk-london-1.oraclecloudapps.com/ords/admin/arss/xxgstt_arss_invoice_request/get_new_invoice_id/:old_invoice_id

https://foizja9l9puedqg-gsttadwdev.adb.uk-london-1.oraclecloudapps.com/ords/admin/arss/xxgstt_arss_invoice_request/get_invoice_lines/:invoice_id

BEGIN
  ORDS.define_template(
   p_module_name    => 'arss/xxgstt_arss_invoice_request',
   p_pattern        => 'duplicate_invoice/:inv_id/:requestor');

  ORDS.define_handler(
    p_module_name    => 'arss/xxgstt_arss_invoice_request',
    p_pattern        => 'duplicate_invoice/:inv_id/:requestor',
    p_method         => 'POST',
    p_source_type    => ORDS.source_type_plsql,
    p_source         => 'BEGIN
                           xxgstt_arss_invoice_request.duplicate_invoice(p_in_inv_id    => :inv_id,
                                           p_in_requestor    => :requestor);
                         END;',
    p_items_per_page => 0);
  COMMIT;
END;
/

https://foizja9l9puedqg-gsttadwdev.adb.uk-london-1.oraclecloudapps.com/ords/admin/arss/xxgstt_arss_invoice_request/duplicate_invoice/1/techtutorsti@gmail.com

BEGIN
  ORDS.define_service(
    p_module_name    => 'arss/xxgstt_arss_invoice_request/get_approvers',
    p_base_path      => 'arss/xxgstt_arss_invoice_request/get_approvers',
    p_pattern        => '/:requestor',
    p_method         => 'GET',
    p_source_type    => ORDS.source_type_collection_feed,
    p_source         => 'select revenuedeptapprover,incomesysteamapprover,financedirectorapprover from vb_vb_istvpkfgk4j.APPROVALHIERARCHY where requestor = :requestor',
    p_items_per_page => 0);

  COMMIT;
END;
/

https://foizja9l9puedqg-gsttadwdev.adb.uk-london-1.oraclecloudapps.com/ords/admin/arss/xxgstt_arss_invoice_request/get_approvers/:requestor/

BEGIN
  ORDS.define_template(
   p_module_name    => 'arss',
   p_pattern        => 'xxgstt_arss_invoice_request/get_approvers/:requestor');

  ORDS.define_handler(
    p_module_name    => 'arss',
    p_pattern        => 'xxgstt_arss_invoice_request/get_approvers/:requestor',
    p_method         => 'GET',
    p_source_type    => ORDS.source_type_collection_item,
    p_source         => 'select revenuedeptapprover,incomesysteamapprover,financedirectorapprover from vb_vb_istvpkfgk4j.APPROVALHIERARCHY where requestor = :requestor',
    p_items_per_page => 0);

  COMMIT;
END;
/

https://foizja9l9puedqg-gsttadwdev.adb.uk-london-1.oraclecloudapps.com/ords/admin/arss/xxgstt_arss_invoice_request/get_approvers/:requestor


BEGIN
  ORDS.define_module(
    p_module_name    => 'arss',
    p_base_path      => 'arss/',
    p_items_per_page => 0);
  
  ORDS.define_template(
   p_module_name    => 'arss',
   p_pattern        => 'xxgstt_arss_invoice_request/get_inv_ref');

  ORDS.define_handler(
    p_module_name    => 'arss',
    p_pattern        => 'xxgstt_arss_invoice_request/get_inv_ref',
    p_method         => 'GET',
    p_source_type    => ORDS.source_type_plsql,
    p_source         => 'BEGIN
                           xxgstt_arss_invoice_request.get_inv_reference(p_invoice_id    => :invoice_id);
                         END;',
    p_items_per_page => 0);

  COMMIT;
END;
/