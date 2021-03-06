// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.disid.proofs.client.web.html;

import com.disid.proofs.client.domain.Person;
import com.disid.proofs.client.service.api.PersonService;
import com.disid.proofs.client.web.html.PersonDeserializer;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonNode;
import io.springlets.web.NotFoundException;
import java.io.IOException;
import org.springframework.boot.jackson.JsonComponent;
import org.springframework.core.convert.ConversionService;

privileged aspect PersonDeserializer_Roo_EntityDeserializer {
    
    declare @type: PersonDeserializer: @JsonComponent;
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return PersonService
     */
    public PersonService PersonDeserializer.getPersonService() {
        return personService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param personService
     */
    public void PersonDeserializer.setPersonService(PersonService personService) {
        this.personService = personService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return ConversionService
     */
    public ConversionService PersonDeserializer.getConversionService() {
        return conversionService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param conversionService
     */
    public void PersonDeserializer.setConversionService(ConversionService conversionService) {
        this.conversionService = conversionService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param jsonParser
     * @param context
     * @param codec
     * @param tree
     * @return Person
     * @throws IOException
     */
    public Person PersonDeserializer.deserializeObject(JsonParser jsonParser, DeserializationContext context, ObjectCodec codec, JsonNode tree) throws IOException {
        String idText = tree.asText();
        Long id = conversionService.convert(idText, Long.class);
        Person person = personService.findOne(id);
        if (person == null) {
            throw new NotFoundException("Person not found");
        }
        return person;
    }
    
}
