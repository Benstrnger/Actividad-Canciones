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

import com.benjamin.modelos.Artista;
import com.benjamin.modelos.Cancion;
import com.benjamin.servicios.ServicioArtistas;
import com.benjamin.servicios.ServicioCanciones;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/artistas")
public class ControladorArtistas {
	
	@Autowired
	private ServicioArtistas serv;
	
	@Autowired
	private ServicioCanciones servCancion;
	
	@GetMapping("")
	public String desplegarArtistas(Model model) {
		
		List<Artista> artistas = serv.obtenerTodosLosArtistas();
		
		model.addAttribute("artistas", artistas);
		
		return "artistas.jsp";
	}
	
	@GetMapping("/detalle/{idArtista}")
	public String desplegarDetalleArtista(@PathVariable("idArtista") Long id, Model model) {
		
		Artista buscar = serv.obtenerArtistaPorId(id);
		model.addAttribute("artista", buscar);
		
		List<Cancion> canciones = servCancion.obtenerTodasLasCanciones();
		model.addAttribute("canciones", canciones);
		
		return "detalleArtista.jsp";
	}
	
	@GetMapping("/formulario/agregar")
	public String formularioAgregarArtista() {
		return "agregarArtista.jsp";
	}
	
	@PostMapping("/procesa/agregar")
	public String procesarAgregarArtista(@Valid @ModelAttribute("artista") Artista artista,
										 BindingResult result) {
		if(result.hasErrors()) {
			return "detalleArtista.jsp";
		}
		serv.agregarArtista(artista);
		return "redirect:/artistas";
	}
}
