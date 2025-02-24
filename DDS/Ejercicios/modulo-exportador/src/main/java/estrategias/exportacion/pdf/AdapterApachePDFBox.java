package estrategias.exportacion.pdf;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.pdmodel.font.Standard14Fonts;

import config.Config;
import exportables.Exportable;

public class AdapterApachePDFBox implements AdapterExportadorPDF {
    private String nombreDeArchivo;

    public AdapterApachePDFBox(String nombreDeArchivo) { this.nombreDeArchivo = nombreDeArchivo; }


    public String exportar(Exportable exportable) {
        PDDocument doc = new PDDocument();
        PDPage myPage = new PDPage();
        doc.addPage(myPage);
        try{
            PDPageContentStream cont = new PDPageContentStream(doc, myPage);
            cont.beginText();
            cont.setFont(new PDType1Font(Standard14Fonts.FontName.TIMES_ROMAN), 12);
            cont.setLeading(14.5f);
            cont.newLineAtOffset(25, 700);
            agregarDatos(cont, exportable.datos());

            cont.endText();
            cont.close();
            doc.save(rutaCompletaDelArchivo());
            doc.close();
        } catch (IOException e){
            e.printStackTrace();
        }
        return rutaCompletaDelArchivo();
    }
    
    private String rutaCompletaDelArchivo() { return Config.RUTA_EXPORTACION + this.nombreDeArchivo; }

    private void agregarDatos(PDPageContentStream pagina, Map<String, List<String>> datos) throws IOException {
        for(Map.Entry<String, List<String>> entry : datos.entrySet()){
            pagina.newLine();
            String datosDeLaFila = String.join(", ", entry.getValue());
            pagina.showText(datosDeLaFila);
        }
    }
}
