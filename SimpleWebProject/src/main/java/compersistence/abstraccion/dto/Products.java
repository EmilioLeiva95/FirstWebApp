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
 
public class Products implements Serializable{
	/**
     * Atributo que almacena el valor que funciona como llave para un objeto de Negocio.
     */
     private Long prodId;
    /**
     * Devuelve el objeto que almacena el identificador del DTO.
     * @return
     */
     public Long getDtoId(){
        return prodId;
     }
    /**
     * Coloca el objeto que almacena el identificador del DTO.
     * @param dtoId objeto que almacena la llave que identifica al DTO. 
     */
     public void setDtoId(Long dtoId){
     	this.prodId = dtoId;
     }
    
    //---- Atributos que almacenan los valores para las propiedades de un objeto DTO correspondiente a un objeto Negocio. ----//
     
     private Long category;
	 
     private String title;
	 
     private String actor;
	 
     private java.math.BigDecimal price;
	 
     private Long special;
	 
     private Long commonProdId;
	 



     
    
    //---- M&eacute;todos que devuelven y colocan los valores de los atributos respectivos del DTO. ----//
     
     public Long getProdId(){
		return this.prodId;         
     }

     public void setProdId( Long prodId){
		this.prodId = prodId;
     }
     public Long getCategory(){
		return this.category;         
     }

     public void setCategory( Long category){
		this.category = category;
     }
     public String getTitle(){
		return this.title;         
     }

     public void setTitle( String title){
		this.title = title;
     }
     public String getActor(){
		return this.actor;         
     }

     public void setActor( String actor){
		this.actor = actor;
     }
     public java.math.BigDecimal getPrice(){
		return this.price;         
     }

     public void setPrice( java.math.BigDecimal price){
		this.price = price;
     }
     public Long getSpecial(){
		return this.special;         
     }

     public void setSpecial( Long special){
		this.special = special;
     }
     public Long getCommonProdId(){
		return this.commonProdId;         
     }

     public void setCommonProdId( Long commonProdId){
		this.commonProdId = commonProdId;
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
    	   Products otherProducts = (Products) obj;
    	   EqualsBuilder eq = new EqualsBuilder();
           eq.append(category, otherProducts.category);
           eq.append(title, otherProducts.title);
           eq.append(actor, otherProducts.actor);
           eq.append(price, otherProducts.price);
           eq.append(special, otherProducts.special);
           eq.append(commonProdId, otherProducts.commonProdId);
           eq.append(prodId, otherProducts.prodId);
    	   return eq.isEquals();
    }
    
    
     public int hashCode() {
	     return new HashCodeBuilder()
                  .append(category)
                  .append(title)
                  .append(actor)
                  .append(price)
                  .append(special)
                  .append(commonProdId)
                  .append(prodId)
	              .toHashCode();
   }
    
    
   public String toString() {
     return new ToStringBuilder(this)
                  .append("category",category)
                  .append("title",title)
                  .append("actor",actor)
                  .append("price",price)
                  .append("special",special)
                  .append("commonProdId",commonProdId)
                  .append("prodId",prodId)
                  .toString();
   }    
    
    
}
