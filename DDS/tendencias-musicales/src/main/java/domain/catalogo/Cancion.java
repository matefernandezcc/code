package domain.catalogo;

import domain.tendencias.EnAuge;
import domain.tendencias.Normal;
import domain.tendencias.Popularidad;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class Cancion {
    private String nombre;
    private Integer cantReproducciones;
    private Integer cantLikes;
    private Integer cantDislikes;
    private LocalDateTime ultVezReproducida;
    private Album album;
    private Popularidad popularidad;

    /* //////////////////// Constructor, tiene que coincidir con el nombre de la clase //////////////////// */
    public Cancion(String nombre) {
        this.nombre = nombre;
        this.cantReproducciones = 0;
        this.cantLikes = 0;
        this.cantDislikes = 0;
        this.popularidad = new Normal();
    }

    /* //////////////////// Metodos de la clase Cancion //////////////////// */
    private void reproducir(){
        this.cantReproducciones++;
        this.popularidad.reproducir(this);
        this.ultVezReproducida = LocalDateTime.now();
    }

    public String serReproducida(){
        this.reproducir();
        return this.popularidad.generarDetallePara(this); 
    }

    /* //////////////////// Setters y Getters  //////////////////// */
    // Op.1: Se escribe manualmente uno por uno en los atributos que lo necesitan
    public void setEjemploCantDislikes(Integer cantDislikes) {}

    // Op.2: Se usa Lombock, que es una dependencia de Maven que sirve para ponerle getters t setters automaticamente
    // escribiendo @Getter o @Setter segun corresponda, arriba del elemento al que le quiero aplicar esto (atributos o clases)
}
