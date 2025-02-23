package domain.tendencias;

import domain.catalogo.Cancion;

public abstract class Popularidad {
    public abstract void reproducir(Cancion cancion);

    // Patron Template Method
    public String generarDetallePara(Cancion cancion) {
        String detalle = "";
        detalle = this.icono();
        detalle += " ";
        detalle += this.leyenda(cancion);

        return detalle;        
    }

    protected abstract String leyenda(Cancion cancion);

    protected abstract String icono();
}
