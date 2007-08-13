<?php
/**
 * Zend Framework
 *
 * LICENSE
 *
 * This source file is subject to the new BSD license that is bundled
 * with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://framework.zend.com/license/new-bsd
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@zend.com so we can send you a copy immediately.
 *
 * @category   Zend
 * @package    Zend_Pdf
 * @copyright  Copyright (c) 2005-2007 Zend Technologies USA Inc. (http://www.zend.com)
 * @license    http://framework.zend.com/license/new-bsd     New BSD License
 */


/** Zend_Pdf_Element */
require_once 'Zend/Pdf/Element.php';

/** Zend_Pdf_ElementFactory */
require_once 'Zend/Pdf/ElementFactory.php';


/**
 * PDF file 'indirect object' element implementation
 *
 * @category   Zend
 * @package    Zend_Pdf
 * @copyright  Copyright (c) 2005-2007 Zend Technologies USA Inc. (http://www.zend.com)
 * @license    http://framework.zend.com/license/new-bsd     New BSD License
 */
class Zend_Pdf_Element_Object extends Zend_Pdf_Element
{
    /**
     * Object value
     *
     * @var Zend_Pdf_Element
     */
    protected $_value;

    /**
     * Object number within PDF file
     *
     * @var integer
     */
    protected $_objNum;

    /**
     * Generation number
     *
     * @var integer
     */
    protected $_genNum;

    /**
     * Reference to the factory.
     *
     * @var Zend_Pdf_ElementFactory
     */
    protected $_factory;

    /**
     * Object constructor
     *
     * @param Zend_Pdf_Element $val
     * @param integer $objNum
     * @param integer $genNum
     * @param Zend_Pdf_ElementFactory $factory
     * @throws Zend_Pdf_Exception
     */
    public function __construct(Zend_Pdf_Element $val, $objNum, $genNum, Zend_Pdf_ElementFactory $factory)
    {
        if ($val instanceof self) {
            throw new Zend_Pdf_Exception('Object number must not be instance of Zend_Pdf_Element_Object.');
        }

        if ( !(is_integer($objNum) && $objNum > 0) ) {
            throw new Zend_Pdf_Exception('Object number must be positive integer.');
        }

        if ( !(is_integer($genNum) && $genNum >= 0) ) {
            throw new Zend_Pdf_Exception('Generation number must be non-negative integer.');
        }

        $this->_value   = $val;
        $this->_objNum  = $objNum;
        $this->_genNum  = $genNum;
        $this->_factory = $factory;

        $factory->registerObject($this);
    }


    /**
     * Check, that object is generated by specified factory
     *
     * @return Zend_Pdf_ElementFactory
     */
    public function getFactory()
    {
        return $this->_factory;
    }

    /**
     * Return type of the element.
     *
     * @return integer
     */
    public function getType()
    {
        return $this->_value->getType();
    }


    /**
     * Get object number
     *
     * @return integer
     */
    public function getObjNum()
    {
        return $this->_objNum;
    }


    /**
     * Get generation number
     *
     * @return integer
     */
    public function getGenNum()
    {
        return $this->_genNum;
    }


    /**
     * Return reference to the object
     *
     * @param Zend_Pdf_Factory $factory
     * @return string
     */
    public function toString($factory = null)
    {
        if ($factory === null) {
            $shift = 0;
        } else {
            $shift = $factory->getEnumerationShift($this->_factory);
        }

        return $this->_objNum + $shift . ' ' . $this->_genNum . ' R';
    }


    /**
     * Dump object to a string to save within PDF file.
     *
     * $factory parameter defines operation context.
     *
     * @param Zend_Pdf_ElementFactory $factory
     * @return string
     */
    public function dump(Zend_Pdf_ElementFactory $factory)
    {
        $shift = $factory->getEnumerationShift($this->_factory);

        return  $this->_objNum + $shift . " " . $this->_genNum . " obj \n"
             .  $this->_value->toString($factory) . "\n"
             . "endobj\n";
    }

    /**
     * Get handler
     *
     * @param string $property
     * @return mixed
     */
    public function __get($property)
    {
        return $this->_value->$property;
    }

    /**
     * Set handler
     *
     * @param string $property
     * @param  mixed $value
     */
    public function __set($property, $value)
    {
        $this->_value->$property = $value;
    }

    /**
     * Call handler
     *
     * @param string $method
     * @param array  $args
     * @return mixed
     */
    public function __call($method, $args)
    {
        switch (count($args)) {
            case 0:
                return $this->_value->$method();
            case 1:
                return $this->_value->$method($args[0]);
            case 2:
                return $this->_value->$method($args[0], $args[1]);
            case 3:
                return $this->_value->$method($args[0], $args[1], $args[2]);
            case 4:
                return $this->_value->$method($args[0], $args[1], $args[2], $args[3]);
            default:
                throw new Zend_Pdf_Exception('Unsupported number of arguments');
        }
    }


    /**
     * Mark object as modified, to include it into new PDF file segment
     */
    public function touch()
    {
        $this->_factory->markAsModified($this);
    }

    /**
     * Clean up resources, used by object
     */
    public function cleanUp()
    {
        $this->_value = null;
    }
}
