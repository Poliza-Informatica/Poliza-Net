/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.redmoon.poliza.net.polizas;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import es.redmoon.poliza.net.session.PoolConn;
import java.awt.Color;
import java.io.ByteArrayOutputStream;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.Calendar;
import java.util.Locale;
import javax.naming.NamingException;

/**
 *
 * @author antonio
 */
public class ListadoPolizas extends PoolConn {

    private final String version;
    private static final Font FUENTE_CUERPO = FontFactory.getFont(FontFactory.HELVETICA, 9, Font.NORMAL, Color.BLACK);
    private BigDecimal SumaTotal= new BigDecimal(0);
    private BigDecimal iva= new BigDecimal(0);
    private BigDecimal Suma21iva= new BigDecimal(0);
    private BigDecimal Suma10iva= new BigDecimal(0);
    private BigDecimal Suma4iva= new BigDecimal(0);
    private BigDecimal SumaBases= new BigDecimal(0);
    private PdfWriter writer;
    private Document document;
    private ByteArrayOutputStream PDFenMemoria = new ByteArrayOutputStream();
    private PdfPTable table;
    private PdfPCell cell;
    private Paragraph p;

    public ListadoPolizas(String DataBase) throws SQLException, NamingException {
        super(DataBase);
        this.version=DataBase;
    }

    /**
     * Devuelve un listado
     * @param xYear
     * @param xTrimestre
     * @param xNIF
     * @param xNombre
     * @return
     * @throws DocumentException
     * @throws SQLException 
     */
    public byte[] makeListado(String xTipo, String xYear, String xTrimestre, String xNIF, String xNombre) throws DocumentException, SQLException
    {
        String sentencia;
        if ("V".equals(xTipo))
            sentencia="select T.base*T.iva/100 as impIVA,T.id_bill,T.iva,B.fecha,B.numero,B.nif,B.nombre,T.base,T.base+(T.base*T.iva/100) as total from total_bill T, vwhead_bill B \n" +
            "where B.id=T.id_bill and B.fiscal_year='"+xYear+"' and B.trimestre='"+xTrimestre+"'\n" +
            "order by T.id_bill";
        else
            sentencia="select get_BaseImponible(importe, por_dto, unidades) as base, get_IVAImporte(importe, por_dto, unidades, por_vat) as impiva, por_vat as iva,\n" +
            "total, fecha,\n" +
            "v.id::char as numero,nif,nombre\n" +
            "from row_invoices_received r, vw_recibidas v\n" +
            "where r.id_inre = v.id\n" +
            "and fiscal_year='"+xYear+"' and trimestre='"+xTrimestre+"'\n" +
            "order by v.id";
        
        sentencia="select * from vw_lista_polizas";
        
        CreatePDF();
        HeaderTable(xTipo, xYear, xTrimestre, xNIF, xNombre);
        CuerpoTable(sentencia);
        Totales();
        Grabar();
        return PDFenMemoria.toByteArray();
    }

    /**
     * Crear un documento PDF con los datos del informe
     * @throws DocumentException 
     */
    
    private void CreatePDF() throws DocumentException
    {
        
        this.document = new Document(PageSize.A4.rotate());
        
        writer = PdfWriter.getInstance(this.document, PDFenMemoria);
        
        this.document.open();
        
    }
    
    /**
     * Cabecera de la tabla
     * @param xYear
     * @param xTrimestre
     * @param xNIF
     * @param xNombre 
     */
    private void HeaderTable(String xTipo, String xYear, String xTrimestre, String xNIF, String xNombre)
    {
        Calendar javaCalendar = null;
        String currentDate = "";

        javaCalendar = Calendar.getInstance();

        currentDate = javaCalendar.get(Calendar.YEAR) +
                "/" + (javaCalendar.get(Calendar.MONTH) + 1) + 
                "/" + javaCalendar.get(Calendar.DATE);
        
        float[] widths1 = { 0.5f, 1f, 1f, 1f, 3f, 1f, 1f, 1f, 1f, 1f};
        
        this.table = new PdfPTable(widths1);
        
        table.setWidthPercentage(100);
        table.setHeaderRows(3);
        
        String titulo;
        if ("V".equals(xTipo))
            titulo = "Listado de Pólizas "+xYear+" Trimestre "+xTrimestre;
        else
            titulo = "Listado de Pólizas "+xYear+" Trimestre "+xTrimestre;
        
        PdfPCell h1 = new PdfPCell(new Paragraph(titulo));
        
        h1.setGrayFill(0.7f);
        h1.setColspan(10);
        h1.setHorizontalAlignment(Element.ALIGN_CENTER);
        
        table.addCell(h1);
        
        PdfPCell h2 = new PdfPCell(new Paragraph(xNIF+" "+xNombre+" a fecha "+currentDate));
        h2.setGrayFill(0.7f);
        h2.setColspan(10);
        h2.setHorizontalAlignment(Element.ALIGN_LEFT);
        
        table.addCell(h2);

        PdfPCell h21 = new PdfPCell(new Paragraph("Póliza"));
        PdfPCell h22 = new PdfPCell(new Paragraph("Producto"));
        PdfPCell h23 = new PdfPCell(new Paragraph("NIF/CIF"));
        PdfPCell h24 = new PdfPCell(new Paragraph("Tomador"));
        PdfPCell h25 = new PdfPCell(new Paragraph("Riesgo Asegurado"));
        PdfPCell h26 = new PdfPCell(new Paragraph("Efecto"));
        PdfPCell h27 = new PdfPCell(new Paragraph("IVA 21%"));
        PdfPCell h28 = new PdfPCell(new Paragraph("IVA 10%"));
        PdfPCell h29 = new PdfPCell(new Paragraph("IVA  4%"));
        PdfPCell h20 = new PdfPCell(new Paragraph("Total"));


        h21.setGrayFill(0.7f);
        h22.setGrayFill(0.7f);
        h23.setGrayFill(0.7f);
        h24.setGrayFill(0.7f);
        h25.setGrayFill(0.7f);
        h26.setGrayFill(0.7f);
        h26.setHorizontalAlignment(Element.ALIGN_RIGHT);
        h27.setGrayFill(0.7f);
        h27.setHorizontalAlignment(Element.ALIGN_RIGHT);
        h28.setGrayFill(0.7f);
        h28.setHorizontalAlignment(Element.ALIGN_RIGHT);
        h29.setGrayFill(0.7f);
        h29.setHorizontalAlignment(Element.ALIGN_RIGHT);
        h20.setGrayFill(0.7f);
        h20.setHorizontalAlignment(Element.ALIGN_RIGHT);

        table.addCell(h21);
        table.addCell(h22);
        table.addCell(h23);
        table.addCell(h24);
        table.addCell(h25);
        table.addCell(h26);
        table.addCell(h27);
        table.addCell(h28);
        table.addCell(h29);
        table.addCell(h20);
    }
    
    private void CuerpoTable(String sentencia) throws SQLException
    {
        
        Connection conn= PGconectar();
        PreparedStatement st = conn.prepareStatement(sentencia);
        ResultSet rs = st.executeQuery();
            
        int j=1;
        
        while (rs.next())
        {
            
            p = new Paragraph(Integer.toString(j),FUENTE_CUERPO);
            p.setAlignment(Element.ALIGN_RIGHT);
            cell = new PdfPCell();
            cell.addElement(p);
            table.addCell(cell);
            
            p = new Paragraph(rs.getString("numero"),FUENTE_CUERPO);
            p.setAlignment(Element.ALIGN_LEFT);
            cell = new PdfPCell();
            cell.addElement(p);
            table.addCell(cell);
            
            p = new Paragraph(rs.getDate("fecha").toString(),FUENTE_CUERPO);
            p.setAlignment(Element.ALIGN_LEFT);
            cell = new PdfPCell();
            cell.addElement(p);
            table.addCell(cell);

            p = new Paragraph(rs.getString("nif"),FUENTE_CUERPO);
            p.setAlignment(Element.ALIGN_LEFT);
            cell = new PdfPCell();
            cell.addElement(p);
            table.addCell(cell);

            p = new Paragraph(rs.getString("nombre"),FUENTE_CUERPO);
            p.setAlignment(Element.ALIGN_LEFT);
            cell = new PdfPCell();
            cell.addElement(p);
            table.addCell(cell);
            
            p = new Paragraph(NumberFormat.getCurrencyInstance(Locale.GERMANY).format(rs.getBigDecimal("base")),FUENTE_CUERPO);
            p.setAlignment(Element.ALIGN_RIGHT);
            cell = new PdfPCell();
            cell.addElement(p);
            table.addCell(cell);
            
            iva=rs.getBigDecimal("iva");
            if (iva.compareTo(new BigDecimal(21))==0)
            {
                p = new Paragraph(NumberFormat.getCurrencyInstance(Locale.GERMANY).format(rs.getBigDecimal("impiva")),FUENTE_CUERPO);
                p.setAlignment(Element.ALIGN_RIGHT);
                cell = new PdfPCell();
                cell.addElement(p);
                table.addCell(cell);
                table.addCell("");
                table.addCell("");
                Suma21iva=Suma21iva.add(rs.getBigDecimal("impiva"));
            }
            if (iva.compareTo(new BigDecimal(10))==0)
            {
                table.addCell("");
                p = new Paragraph(NumberFormat.getCurrencyInstance(Locale.GERMANY).format(rs.getBigDecimal("impiva")),FUENTE_CUERPO);
                p.setAlignment(Element.ALIGN_RIGHT);
                cell = new PdfPCell();
                cell.addElement(p);
                table.addCell(cell);
                table.addCell("");
                Suma10iva=Suma10iva.add(rs.getBigDecimal("impiva"));
            }
            if (iva.compareTo(new BigDecimal(4))==0)
            {
                table.addCell("");
                table.addCell("");
                p = new Paragraph(NumberFormat.getCurrencyInstance(Locale.GERMANY).format(rs.getBigDecimal("impiva")),FUENTE_CUERPO);
                p.setAlignment(Element.ALIGN_RIGHT);
                cell = new PdfPCell();
                cell.addElement(p);
                table.addCell(cell);
                Suma4iva=Suma4iva.add(rs.getBigDecimal("impiva"));
            }
            
            
            p = new Paragraph(NumberFormat.getCurrencyInstance(Locale.GERMANY).format(rs.getBigDecimal("total")),FUENTE_CUERPO);
            p.setAlignment(Element.ALIGN_RIGHT);
            cell = new PdfPCell();
            cell.addElement(p);
            table.addCell(cell);
            
            SumaTotal=SumaTotal.add(rs.getBigDecimal("total"));
            SumaBases=SumaBases.add(rs.getBigDecimal("base"));
    
        j++;
        }
        
        st.close();
        conn.close();
    }
    
    /**
     * Imprimir los totales de la factura
     */
    private void Totales()
    {
        // añadir los totales
        PdfPCell pie = new PdfPCell(new Paragraph("Total"));
        pie.setColspan(5);
        pie.setGrayFill(0.7f);
        pie.setHorizontalAlignment(Element.ALIGN_RIGHT);
        table.addCell(pie);
        
        p = new Paragraph(NumberFormat.getCurrencyInstance(Locale.GERMANY).format(SumaBases),FUENTE_CUERPO);
        p.setAlignment(Element.ALIGN_RIGHT);
        cell = new PdfPCell();
        cell.addElement(p);
        table.addCell(cell);
        
        p = new Paragraph(NumberFormat.getCurrencyInstance(Locale.GERMANY).format(Suma21iva),FUENTE_CUERPO);
        p.setAlignment(Element.ALIGN_RIGHT);
        cell = new PdfPCell();
        cell.addElement(p);
        table.addCell(cell);
        
        
        p = new Paragraph(NumberFormat.getCurrencyInstance(Locale.GERMANY).format(Suma10iva),FUENTE_CUERPO);
        p.setAlignment(Element.ALIGN_RIGHT);
        cell = new PdfPCell();
        cell.addElement(p);
        table.addCell(cell);
        
        
        p = new Paragraph(NumberFormat.getCurrencyInstance(Locale.GERMANY).format(Suma4iva),FUENTE_CUERPO);
        p.setAlignment(Element.ALIGN_RIGHT);
        cell = new PdfPCell();
        cell.addElement(p);
        table.addCell(cell);
        
      
        p = new Paragraph(NumberFormat.getCurrencyInstance(Locale.GERMANY).format(SumaTotal),FUENTE_CUERPO);
        p.setAlignment(Element.ALIGN_RIGHT);
        cell = new PdfPCell();
        cell.addElement(p);
        table.addCell(cell);
    }
    
    /**
     * 
     * @throws DocumentException 
     */
    private void Grabar() throws DocumentException
    {
        document.add(table);
        document.close();
        writer.close();
    }
}
