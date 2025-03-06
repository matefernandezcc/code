package domain.catalogo;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

public class CancionTest {
    private Cancion cancion;
    private Artista artista;
    private Album album;


    @BeforeEach // Esto hace que el método se ejecute antes de cada test
    public void init() {
        this.cancion = new Cancion("The Scientist");

        this.artista = new Artista();
        this.artista.setNombre("Coldplay");

        this.album = new Album();
        this.album.setNombre("A Rush of Blood to the head");
        this.album.setArtista(this.artista);
    }

    @Test
    @DisplayName(" 'The Scientist' recién se lanza (tiene popularidad normal).")
    public void cancionEsRecienLanzadaTest(){
        String detalleCompleto = this.cancion.serReproducida();

        String detalleEsperado = ""; // deberia armar el detalle que espero que me devuelva si está en normal

        Assertions.assertEquals(detalleEsperado, detalleCompleto);
    }
}
