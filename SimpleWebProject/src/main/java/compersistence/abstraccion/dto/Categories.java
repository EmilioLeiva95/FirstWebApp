package compersistence.abstraccion.dto;
import java.lang.Long;
import java.io.Serializable;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
/**
 * Clase POJO(Plain Old Java Object), que permite almacenar los valores de las propiedades de un objeto de negocio, tambi&eacute;n conocido como DTO(Data Transfer Object).
 * Este DTO es el que viaja entre la capa DAO y la capa de negocios, y que posteriormente es manipulado en la capa de la vista.  
 * 
 * @author Systems Out of the Box
 * @version f3.1 --
 */
 
public class Categories implements Serializable{
	/**
     * Atributo que almacena el valor que funciona como llave para un objeto de Negocio.
     */
     private Long category;
    /**
     * Devuelve el objeto que almacena el identificador del DTO.
     * @return
     */
     public Long getDtoId(){
        return category;
     }
    /**
     * Coloca el objeto que almacena el identificador del DTO.
     * @param dtoId objeto que almacena la llave que identifica al DTO. 
     */
     public void setDtoId(Long dtoId){
     	this.category = dtoId;
     }
    
    //---- Atributos que almacenan los valores para las propiedades de un objeto DTO correspondiente a un objeto Negocio. ----//
     
     private String categoryname;
	 



     
    
    //---- M&eacute;todos que devuelven y colocan los valores de los atributos respectivos del DTO. ----//
     
     public Long getCategory(){
		return this.category;         
     }

     public void setCategory( Long category){
		this.category = category;
     }
     public String getCategoryname(){
		return this.categoryname;         
     }

     public void setCategoryname( String categoryname){
		this.categoryname = categoryname;
     }



    public boolean equals(Object obj){
        return equals(obj,true);
    }
    
    
    public boolean equals(Object obj, boolean conForaneos) {
    	   if (obj == null) { return false; }
    	   if (obj == this) { return true; }
    	   if (obj.getClass() != getClass()) {
    	     return false;
    	   }
    	   Categories otherCategories = (Categories) obj;
    	   EqualsBuilder eq = new EqualsBuilder();
           eq.append(categoryname, otherCategories.categoryname);
           eq.append(category, otherCategories.category);
    	   return eq.isEquals();
    }
    
    
     public int hashCode() {
	     return new HashCodeBuilder()
                  .append(categoryname)
                  .append(category)
	              .toHashCode();
   }
    
    
   public String toString() {
     return new ToStringBuilder(this)
                  .append("categoryname",categoryname)
                  .append("category",category)
                  .toString();
   }    
    
    
}
