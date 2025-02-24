package exportador;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import config.Config;
import estrategias.EstrategiaDeExportacion;
import estrategias.exportacion.excel.ExportarAExcel;
import estrategias.exportacion.pdf.AdapterApachePDFBox;
import estrategias.exportacion.pdf.ExportarAPDF;
import exportables.Documento;
import static org.mockito.Mockito.*;

public class ExportadorTest {
    private Exportador exportador;

    private Documento documento;

    @BeforeEach
    public void init(){
        this.exportador = new Exportador(new ExportarAExcel("datos.xlsx"));
        Documento documento = new Documento();
        documento.agregarDato("0", "Nombre", "Apellido", "Edad");
        this.documento = documento;
    }

    @Test
    public void exportarAExcelGeneraArchivo(){
        this.documento.agregarDato("1", "Ezequiel", "Escobar", "24");
        this.documento.agregarDato("2", "Mateo", "Fernandez", "21");
        this.exportador.setExportable(this.documento);
        Assertions.assertEquals(Config.RUTA_EXPORTACION + "datos.xlsx", this.exportador.exportar());
    }

    @Test
    public void exportarAPDFGeneraArchivo(){
        this.documento.agregarDato("1", "Ezequiel", "Escobar", "24");
        this.documento.agregarDato("2", "Mateo", "Fernandez", "21");

        //TODO Pendiente a mejorar el ocultamiento del ExportarAPDF y AdapterApachePDFBox
        this.exportador.setEstrategia(new ExportarAPDF(new AdapterApachePDFBox("datos.pdf")));
        this.exportador.setExportable(this.documento);
        Assertions.assertEquals(Config.RUTA_EXPORTACION + "datos.pdf", this.exportador.exportar());
    }

    @Test
    public void exportarAExcelDevuelveCorrectamenteLaRutaEsperada(){
        this.documento.agregarDato("1", "Ezequiel", "Escobar", "24");
        this.documento.agregarDato("2", "Mateo", "Fernandez", "21");

        EstrategiaDeExportacion exportacionAExcelMock = mock(ExportarAExcel.class);
        String ruta = Config.RUTA_EXPORTACION + "datos.xlsx";

        // El mock se "saltea" la implementacion de la clase ExportarAExcel y directamente genera el output que esperamos
        when(exportacionAExcelMock.exportar(this.documento)).thenReturn(ruta);

        this.exportador.setEstrategia(exportacionAExcelMock);
        this.exportador.setExportable(this.documento);
        String rutaDondeGeneroElArchivo = this.exportador.exportar();

        Assertions.assertEquals(ruta, rutaDondeGeneroElArchivo);

        verify(exportacionAExcelMock).exportar(this.documento);
    }
}