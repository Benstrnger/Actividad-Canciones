package com.benjamin.servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.benjamin.modelos.Cancion;
import com.benjamin.repositorios.RepositorioCanciones;

@Service
public class ServicioCanciones {

	@Autowired
	private RepositorioCanciones repoCanciones;
	
	public List<Cancion> obtenerTodasLasCanciones() {
		return repoCanciones.findAll();
	}
	
	public Cancion obtenerCancionPorId(Long id) {
		return repoCanciones.findById(id).orElse(null);
	}
	
	public Cancion agregarCancion(Cancion nuevaCancion) {
		return repoCanciones.save(nuevaCancion);
	}
	
	public Cancion actualizaCancion(Cancion nuevaInfo) {
		return repoCanciones.save(nuevaInfo);
	}
}
