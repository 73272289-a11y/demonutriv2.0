package com.example.demo.MetodoPago;

public class MetodoPago {

    private int id;
    private String nombre;
    private String numero;
    private boolean activo;

    public MetodoPago() {
    }

    public MetodoPago(int id, String nombre, String numero, boolean activo) {
        this.id = id;
        this.nombre = nombre;
        this.numero = numero;
        this.activo = activo;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getNumero() { return numero; }
    public void setNumero(String numero) { this.numero = numero; }

    public boolean isActivo() { return activo; }
    public void setActivo(boolean activo) { this.activo = activo; }
}
