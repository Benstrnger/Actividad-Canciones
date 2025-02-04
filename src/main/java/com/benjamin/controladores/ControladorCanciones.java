package com.benjamin.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.benjamin.modelos.Cancion;
import com.benjamin.servicios.ServicioCanciones;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/canciones")
public class ControladorCanciones {
	
	@Autowired
	private ServicioCanciones serv;
	
	@GetMapping("")
	public String desplegarCanciones(Model model) {
		
		List<Cancion> canciones = serv.obtenerTodasLasCanciones();
		
		model.addAttribute("canciones", canciones);
		
		return "canciones.jsp";
	}
	
	@GetMapping("/detalle/{idCancion}")
	public String desplegarDetalleCancion(@PathVariable("idCancion") Long id, Model model) {
		
		Cancion busqueda = serv.obtenerCancionPorId(id);
		
		model.addAttribute("cancion", busqueda);
		
		return "detalleCancion.jsp";
	}
	
	//Ruta 1
	@GetMapping("/formulario/agregar")
	public String formularioAgregarCancion(@ModelAttribute("cancion") Cancion newSong) {
		return "agregarCancion.jsp";
	}
	
	//Ruta 2
	@PostMapping("/procesa/agregar")
	public String procesarAgregarCancion(@Valid @ModelAttribute("cancion") Cancion newSong,
										 BindingResult result) {
		
		if(result.hasErrors()) {
			return "agregarCancion.jsp";
		} else {
			serv.agregarCancion(newSong);
			return "redirect:/canciones";
		}
	}
}
