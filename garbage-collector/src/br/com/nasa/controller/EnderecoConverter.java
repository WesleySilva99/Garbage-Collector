package br.com.nasa.controller;

import org.springframework.core.convert.converter.Converter;

import br.com.nasa.dao.EnderecoDao;
import br.com.nasa.model.Endereco;

public class EnderecoConverter implements Converter<String, Endereco> {

    public Endereco convert(String id) {

	if (id != null && !id.equals("")) {
	    EnderecoDao dao = new EnderecoDao();
	    Endereco endereco = dao.pegarId(Integer.valueOf(id));
	    return endereco;
	} else {
	    return null;
	}

    }
}