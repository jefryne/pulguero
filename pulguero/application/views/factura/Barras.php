<?php

	# Incluyendo librerias necesarias #
    require "./assets/facturaitems/code128.php";

    $pdf = new PDF_Code128('P','mm',array(80,80));
    $pdf->SetMargins(4,10,4);
    $pdf->AddPage();
    
    
        # Codigo de barras #
        $pdf->Code128(5,$pdf->GetY(),$id_inventory,70,20);
        $pdf->SetXY(0,$pdf->GetY()+21);
        $pdf->SetFont('Arial','',14);
        $pdf->MultiCell(0,5,iconv("UTF-8", "ISO-8859-1",$id_inventory),0,'C',false);
        
        # Nombre del archivo PDF #
        $pdf->Output("I","Ticket_Nro_1.pdf",true);
    ?>